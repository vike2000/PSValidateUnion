A union type argument validation attribute written and for use in pwsh .ps1 code.

Current limitations
----

Currently only supporting one to eight types in the union set. More are possible but must be added in the module source.

Examples
----

```ps1
function example([ValidateUnion([scriptBlock], [string])] $argument) {}
```