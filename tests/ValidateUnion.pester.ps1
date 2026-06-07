beforeAll {
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

# vike's personal execution: cd1 /œ∂/ps1/com.dyn_o_saur.bluelephant.pwsh/ValidateUnion invoke-isolated -verbose -usingPathModule ./ValidateUnion.psd1 {invoke-pester tests/*}