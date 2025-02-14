enum WidgetStyle {
  material(title: 'Material'),
  cupertino(title: 'Cupertino');

  final String title;

  const WidgetStyle({required this.title});
}
