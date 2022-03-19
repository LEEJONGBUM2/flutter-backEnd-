
class Countries {  
  const Countries({required this.title, required this.image, required this.routename});  
  final String title;  
  final String image;  
  final routename;
}  
  
 List<Countries> countries = <Countries>[  
  const Countries(title: 'China', image: 'assets/images/Flags/China.jpg', routename: ('')),
  const Countries(title: 'Malaysia', image: 'assets/images/Flags/Malaysia.png', routename: ('/CulturalFoods')),
  const Countries(title: 'Pakistan', image: 'assets/images/Flags/Pakistan.png', routename: ('')),
  const Countries(title: 'SouthKorea', image: 'assets/images/Flags/SouthKorea.png', routename: ('')),
  const Countries(title: 'USA', image: 'assets/images/Flags/USA.jpg', routename: ('')), 
];  
