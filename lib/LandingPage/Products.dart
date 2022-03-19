
class Choice {  
  const Choice({required this.title, required this.image, required this.routename});  
  final String title;  
  final String image;  
  final routename;
}  
  
 List<Choice> choices = <Choice>[  
  const Choice(title: 'Eateries', image: 'assets/images/Categories/eateries.png', routename: ('/Eateries')),
  const Choice(title: 'Services', image: 'assets/images/Categories/services.png', routename: null, ),
  const Choice(title: 'Beauty', image: 'assets/images/Categories/beauty.png', routename: null, ),
  const Choice(title: 'HealthCare', image: 'assets/images/Categories/healthcare.png', routename: null,),
  const Choice(title: 'Education', image: 'assets/images/Categories/education.png', routename: null, ),
  const Choice(title: 'Event', image: 'assets/images/Categories/event.png', routename: null, ),
  const Choice(title: 'Leisure', image: 'assets/images/Categories/leisure.png', routename: null, ),
  const Choice(title: 'Home & Office', image: 'assets/images/Categories/home.png', routename: null,),
  const Choice(title: 'Finance', image: 'assets/images/Categories/finance.png', routename: null, ),
  const Choice(title: 'Industries', image: 'assets/images/Categories/industry.png', routename: null, ),
  const Choice(title: 'RSVP', image: 'assets/images/Categories/rsvp.png', routename: null, ),
  const Choice(title: 'Promotions', image: 'assets/images/Categories/promotions.png', routename: null, ),  

 
];  