enum HeatUnit {
  celsius(symbol: "°C"),
  fahrenheit(symbol: "°F");

  final String symbol;

  const HeatUnit({required this.symbol});
}
