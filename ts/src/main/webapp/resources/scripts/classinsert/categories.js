var categoriesDict = document.querySelector(".js_categories").value;
document.querySelector(".js_categories").remove();
categoriesDict = JSON.parse(categoriesDict);
var mainCateogreies = categoriesDict['mainMap'];
var subCategories = categoriesDict['subMap'];

var mainCateoreies_Liteners = document.querySelector(".js_mainCateoreies_Litener");
var main_Cateogreies_Key = Object.keys(mainCateogreies);
for (var mainIndex = 0; mainIndex < main_Cateogreies_Key.length; mainIndex++) {
    var option = document.createElement('option');
    option.value = main_Cateogreies_Key[mainIndex];
    option.innerHTML = mainCateogreies[option.value];
    mainCateoreies_Liteners.appendChild(option);
}

var subCateoreies_Litener = document.querySelector(".js_subCateoreies_Litener");
mainCateoreies_Liteners.addEventListener("change", function (_event) {
    subCateoreies_Litener.innerHTML = "";
    var sub_categories_arr = subCategories[this.value];
    for (var sub_index = 0; sub_index < sub_categories_arr.length; sub_index++) {
        var option = document.createElement('option');
        option.value = sub_categories_arr[sub_index];
        option.text = sub_categories_arr[sub_index];
        subCateoreies_Litener.appendChild(option);
    }
});