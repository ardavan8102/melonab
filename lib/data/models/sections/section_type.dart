enum SectionType {
  header,
  sliderSquare,
  unknown,
}

SectionType parseSectionType(String? type) {
  switch (type) {
    case 'header':
      return SectionType.header;
    case 'slider_square':
      return SectionType.sliderSquare;
    default:
      return SectionType.unknown;
  }
}