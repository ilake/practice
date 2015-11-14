# https://medium.com/magnetis-backstage/communication-between-rails-engines-ea5953250121
module Accounting
  class << self
    attr_writer :credit_report

    def credit_report
      Object.const_get(@credit_report)
    end

    # Accounting.config do |a|
    #   a.credit_report = "CreditReport"
    # end
    def config
      yield self
    end
  end
end
