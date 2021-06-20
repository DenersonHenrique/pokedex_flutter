class AbilitiesEntity {
  int slot;
  bool isHidden;
  AbilityEntity ability;

  AbilitiesEntity({
    this.ability,
    this.isHidden,
    this.slot,
  });
}

class AbilityEntity {
  String name;
  String url;

  AbilityEntity({
    this.name,
    this.url,
  });
}
