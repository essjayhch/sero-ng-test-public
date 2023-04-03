## Layout
This is set out to use terraform modules where possible, and standalone terraform where not.
In order to maintain reporducibility, the system is designed to act as DRY as possible, thus terragrunt has been used as a terraform wrapper to achieve this.
This allows individual components to easily be changed independantly of each other whilst fixing the rest of the system in a standard state

One can run terragrunt apply-all and apply the various components, or it could be used independently in each of the modules.


