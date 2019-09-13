const array_index = 0;
const subbar_Next = document.querySelector("div.cs_quickMenu_Subbar > #js_subbar_Next");
const subbar_Previous = document.getElementById("js_subbar_Previous");
const img_Form_Sticky = document.getElementById("js_img_sticky");

function fn_show_next_goods() {
    const img_sticky = document.getElementById("js_img_sticky");
    const cur_goods_num = document.getElementById("js_subbar_Status");
    const _h_goods_id = document.js_form_QuickMenu.js_quickMenu_Form_QuickMenu_Goods_Id;
    const _h_goods_fileName = document.js_form_QuickMenu.js_quickMenu_Form_QuickMenu_Goods_FileName;
    if (array_index < _h_goods_id.length - 1) array_index++;

    const goods_id = _h_goods_id[array_index].value;
    const fileName = _h_goods_fileName[array_index].value;
    img_sticky.src = CONTEXT_PATH + '/' + thumbnails + '/' + "?goods_id=" + goods_id + "&fileName=" + fileName;
    cur_goods_num.innerHTML = array_index + 1;
}

function fn_show_previous_goods() {
    const img_sticky = document.getElementById("js_img_sticky");
    const cur_goods_num = document.getElementById("js_subbar_Status");
    const _h_goods_id = document.js_form_QuickMenu.js_quickMenu_Form_QuickMenu_Goods_Id;
    const _h_goods_fileName = document.js_form_QuickMenu.js_quickMenu_Form_QuickMenu_Goods_FileName;
    if (array_index > 0) array_index--;

    const goods_id = _h_goods_id[array_index].value;
    const fileName = _h_goods_fileName[array_index].value;
    img_sticky.src = CONTEXT_PATH + '/' + thumbnails + '/' + "?goods_id=" + goods_id + "&fileName=" + fileName;
    cur_goods_num.innerHTML = array_index + 1;
}

function goodsDetail() {
    const cur_goods_num = document.getElementById("js_subbar_Status");
    arrIdx = cur_goods_num.innerHTML - 1;
    const h_goods_id = document.js_form_QuickMenu.js_quickMenu_Form_QuickMenu_Goods_Id;
    if (h_goods_id.length > 1) {
        goods_id = h_goods_id[arrIdx].value;
    } else {
        goods_id = h_goods_id.value;
    }

    const formObj = document.createElement("form");
    const i_goods_id = document.createElement("input");
    i_goods_id.name = "goods_id";
    i_goods_id.value = goods_id;
    formObj.appendChild(i_goods_id);
    document.body.appendChild(formObj);
    formObj.method = "get";
    formObj.action = "${contextPath}/goods/goodsDetail?goods_id=" + goods_id;
    formObj.submit();
}

function init(){
    subbar_Previous.addEventListener("click", fn_show_previous_goods);
    img_Form_Sticky.addEventListener("click", goodsDetail);
    subbar_Next.addEventListener("click", fn_show_next_goods);
}
init();