double? GetAbv(double? original_gravity, double? final_gravity)
{
  double abv = 0.0;

  if(original_gravity == null ||
     final_gravity == null)
    {
      return null;
    }

  abv = (original_gravity - final_gravity) * 131.25;

  // If Above 8% ABV, use 131.25
  // Else use 135
  if(abv <= 8.0)
  {
    abv = (original_gravity - final_gravity) * 135.0;
  }

  return abv;
}