import * as functions from "@google-cloud/functions-framework";
import fetch from "node-fetch";
import { PrismaClient } from "@prisma/client";

type CarbonIntensity = {
  forecast: number;
  actual: number;
  index: "low" | "moderate" | "high" | "very high";
};

type ConsumptionData = {
  from: string;
  to: string;
  intensity: CarbonIntensity;
};

functions.http("ingestConsumptionData", async (_req, res) => {
  const r = await fetch(
    "https://api.carbonintensity.org.uk/intensity/2023-01-01T10:00/2023-01-01T11:00"
  );

  console.log (" Raw Data " + JSON.stringify(r))
  const response = (await r.json()) as { data: ConsumptionData[] };
  console.log(" Retrieved API call with the following: " + JSON.stringify(response) )

  const prisma = new PrismaClient();
  console.log("from: "+response.data[0].from)
  await prisma.data.create({
    data: {
      from: response.data[0].from,
      to: response.data[0].to,
      forecast: response.data[0].intensity.forecast,
      actual: response.data[0].intensity.actual,
    },
  });

  res.send({ status: "ok", data: response.data });
});
