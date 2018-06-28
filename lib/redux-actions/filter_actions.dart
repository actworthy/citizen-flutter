enum FilterButtonSelected {
  none,
  issues,
  actionTypes,
}

class ShowFiltersAction {
  FilterButtonSelected filterButtonSelected;

  ShowFiltersAction(this.filterButtonSelected);
}
