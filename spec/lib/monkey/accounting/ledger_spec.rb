require 'spec_helper'

module Monkey::Accounting

  describe Ledger do
    basedir = File.expand_path '../../../../..', __FILE__
    datadir = "#{basedir}/examples/accounting"

    subject(:ledger) { Ledger.load_file File.join(datadir, filename) }

    context "with sample.dat" do
      let(:filename) { "sample.dat" }

      describe "accounts" do
        subject { ledger.accounts }

        it {
          should =~ [
            # accounts referenced in transactions
            "Assets:Bank:Checking",
            "Assets:Brokerage",
            "Equity:Opening Balances",
            "Expenses:Books",
            "Income:Salary",
            "Liabilities:MasterCard",
            # parent accounts
            "Assets",
            "Assets:Bank",
            "Equity",
            "Expenses",
            "Income",
            "Liabilities"
          ]
        }
      end
    end
  end

end
