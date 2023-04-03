resource "google_monitoring_dashboard" "dashboard" {
  project        = var.project_id
  dashboard_json = <<EOF
{
  "dashboardFilters": [],
  "displayName": "Fetcher Dashboard",
  "mosaicLayout": {
    "columns": 2,
    "tiles": [
      {
        "height": 1,
        "widget": {
          "title": "Widget 1",
          "xyChart": {
            "chartOptions": {
              "mode": "COLOR"
            },
            "dataSets": [
              {
                "minAlignmentPeriod": "60s",
                "plotType": "LINE",
                "targetAxis": "Y1",
                "timeSeriesQuery": {
                  "timeSeriesFilter": {
                    "aggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_RATE"
                    },
                    "filter": "metric.type=\"cloudfunctions.googleapis.com/function/exececution_times\"",
                    "secondaryAggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_NONE"
                    }
                  }
                }
              }
            ],
            "thresholds": [],
            "timeshiftDuration": "0s",
            "yAxis": {
              "label": "",
              "scale": "LINEAR"
            }
          }
        },
        "width": 1
      },
      {
        "height": 1,
        "widget": {
          "title": "Cloud Function - Execution times [50TH PERCENTILE]",
          "xyChart": {
            "chartOptions": {
              "mode": "COLOR"
            },
            "dataSets": [
              {
                "minAlignmentPeriod": "60s",
                "plotType": "LINE",
                "targetAxis": "Y1",
                "timeSeriesQuery": {
                  "timeSeriesFilter": {
                    "aggregation": {
                      "alignmentPeriod": "60s",
                      "crossSeriesReducer": "REDUCE_PERCENTILE_50",
                      "groupByFields": [],
                      "perSeriesAligner": "ALIGN_DELTA"
                    },
                    "filter": "metric.type=\"cloudfunctions.googleapis.com/function/execution_times\" resource.type=\"cloud_function\"",
                    "secondaryAggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_NONE"
                    }
                  }
                }
              }
            ],
            "thresholds": [],
            "timeshiftDuration": "0s",
            "yAxis": {
              "label": "",
              "scale": "LINEAR"
            }
          }
        },
        "width": 1,
        "xPos": 1
      },
      {
        "height": 1,
        "widget": {
          "title": "Cloud Function - Active instances [MEAN]",
          "xyChart": {
            "chartOptions": {
              "mode": "COLOR"
            },
            "dataSets": [
              {
                "minAlignmentPeriod": "60s",
                "plotType": "LINE",
                "targetAxis": "Y1",
                "timeSeriesQuery": {
                  "timeSeriesFilter": {
                    "aggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_MEAN"
                    },
                    "filter": "metric.type=\"cloudfunctions.googleapis.com/function/active_instances\" resource.type=\"cloud_function\"",
                    "secondaryAggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_NONE"
                    }
                  }
                }
              }
            ],
            "thresholds": [],
            "timeshiftDuration": "0s",
            "yAxis": {
              "label": "",
              "scale": "LINEAR"
            }
          }
        },
        "width": 1,
        "yPos": 1
      },
      {
        "height": 1,
        "widget": {
          "title": "Executions [RATE]",
          "xyChart": {
            "chartOptions": {
              "mode": "COLOR"
            },
            "dataSets": [
              {
                "minAlignmentPeriod": "60s",
                "plotType": "LINE",
                "targetAxis": "Y1",
                "timeSeriesQuery": {
                  "timeSeriesFilter": {
                    "aggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_RATE"
                    },
                    "filter": "metric.type=\"cloudfunctions.googleapis.com/function/execution_count\" resource.type=\"cloud_function\"",
                    "secondaryAggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_NONE"
                    }
                  }
                }
              }
            ],
            "thresholds": [],
            "timeshiftDuration": "0s",
            "yAxis": {
              "label": "",
              "scale": "LINEAR"
            }
          }
        },
        "width": 1,
        "xPos": 1,
        "yPos": 1
      },
      {
        "height": 1,
        "widget": {
          "title": "Cloud Function - Instance Count [MEAN]",
          "xyChart": {
            "chartOptions": {
              "mode": "COLOR"
            },
            "dataSets": [
              {
                "minAlignmentPeriod": "60s",
                "plotType": "LINE",
                "targetAxis": "Y1",
                "timeSeriesQuery": {
                  "timeSeriesFilter": {
                    "aggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_MEAN"
                    },
                    "filter": "metric.type=\"cloudfunctions.googleapis.com/function/instance_count\" resource.type=\"cloud_function\"",
                    "secondaryAggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_NONE"
                    }
                  }
                }
              }
            ],
            "thresholds": [],
            "timeshiftDuration": "0s",
            "yAxis": {
              "label": "",
              "scale": "LINEAR"
            }
          }
        },
        "width": 1,
        "yPos": 2
      },
      {
        "height": 1,
        "widget": {
          "title": "Network egress [RATE]",
          "xyChart": {
            "chartOptions": {
              "mode": "COLOR"
            },
            "dataSets": [
              {
                "minAlignmentPeriod": "60s",
                "plotType": "LINE",
                "targetAxis": "Y1",
                "timeSeriesQuery": {
                  "timeSeriesFilter": {
                    "aggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_RATE"
                    },
                    "filter": "metric.type=\"cloudfunctions.googleapis.com/function/network_egress\" resource.type=\"cloud_function\"",
                    "secondaryAggregation": {
                      "alignmentPeriod": "60s",
                      "perSeriesAligner": "ALIGN_NONE"
                    }
                  }
                }
              }
            ],
            "thresholds": [],
            "timeshiftDuration": "0s",
            "yAxis": {
              "label": "",
              "scale": "LINEAR"
            }
          }
        },
        "width": 1,
        "xPos": 1,
        "yPos": 2
      }
    ]
  }
}
EOF
}
