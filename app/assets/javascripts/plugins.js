
function format_plural( count , singular , plural )
{
  switch( count )
  {
    case 1:
      return singular;
    default:
      return plural.replace( '@count' , count );
  }
}