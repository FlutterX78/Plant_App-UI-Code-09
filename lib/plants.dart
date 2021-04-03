class Plants {
  String name;
  String desc;
  String price;
  String imgUrl;
  Plants({this.name, this.desc, this.price, this.imgUrl});
}

List<Plants> plants = [
  Plants(
      imgUrl: 'https://i.postimg.cc/g2SmWt97/p3.png',
      name: 'Boston Ivy',
      desc: 'Climbs their storied walls.',
      price: '\$13'),
  Plants(
      imgUrl: 'https://i.postimg.cc/MZBjbCVY/p2.png',
      name: 'Green Succulent',
      price: '\$11',
      desc: 'Store water in arid climates.'),
  Plants(
      name: 'Dieffenbachia Bonsa',
      price: '\$10',
      imgUrl: 'https://i.postimg.cc/4yy8yNrT/p1.png',
      desc: 'large group of beautiful tropical perennials'),
  Plants(
      imgUrl: 'https://i.postimg.cc/GtLZxtxf/p4.png',
      name: 'Plantagenia',
      desc: 'Grown for their foliage rather than blooms',
      price: '\$9')
];
