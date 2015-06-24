#= require accounting

@localeFormat = (amount) ->
  Number(amount).toLocaleString()

@currencyFormat = (amount) ->
  accounting.formatMoney(amount)

@NumberFormat = (amount) ->
  return amount if typeof(amount) == "number"
  return amount unless amount
  Number(amount.replace(/[^0-9]+/g, ''))
