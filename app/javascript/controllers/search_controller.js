import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dropdownCategory", "categoryField", "dropdownLanguage", "languageField", "dropdownAgeGroup", "ageGroupField"];

  toggleCategoryDropdown(event) {
    event.preventDefault();
    this.dropdownCategoryTarget.classList.toggle("hidden");
  }

  selectCategory(event) {
    event.preventDefault();
    const categoryId = event.currentTarget.dataset.categoryId;
    this.categoryFieldTarget.value = categoryId;
    this.element.submit(); // Submit the form
  }

  toggleLanguageDropdown(event) {
    event.preventDefault();
    this.dropdownLanguageTarget.classList.toggle("hidden");
  }

  selectLanguage(event) {
    event.preventDefault();
    const languageId = event.currentTarget.dataset.languageId;
    this.languageFieldTarget.value = languageId;
    this.element.submit(); // Submit the form
  }

  toggleAgeGroupDropdown(event) {
    event.preventDefault();
    this.dropdownAgeGroupTarget.classList.toggle("hidden");
  }

  selectAgeGroup(event) {
    event.preventDefault();
    const ageGroupId = event.currentTarget.dataset.ageGroupId;
    this.ageGroupFieldTarget.value = ageGroupId;
    this.element.submit(); // Submit the form
  }
}
