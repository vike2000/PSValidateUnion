beforeAll {
	remove-module -ea 0 PSValidateUnion
	import-module "$PSScriptRoot/../ValidateUnion.psd1"
	
	function fixture([ValidateUnion([scriptBlock], [string])] $argument) {}
}

describe "ValidateUnion" {
	it "given a valid argument" {
		{fixture 'test'	}|should -not	-throw
		{fixture {test}	}|should -not	-throw
	}
	it "given an invalid argument" {
		{fixture $true	}|should		-throw -expectedMessage "Cannot validate argument on parameter 'argument'. Type ``[scriptblock``], ``[string``] required, bool $(	)given in value: True"
		{fixture 1		}|should		-throw -expectedMessage "Cannot validate argument on parameter 'argument'. Type ``[scriptblock``], ``[string``] required, int $(	)given in value: 1"
	}
}