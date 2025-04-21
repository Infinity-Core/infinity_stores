$(function () {
    document.getElementById("nui_content").style.display = "none";
    window.addEventListener('message', function(event) {

        let item        = event.data;
        let StoreName   = item.StoreName;
        let DescName    = item.DescName;
        let StoreType   = item.StoreType;
        let StoreTax    = item.StoreTax;

        if (item.type === "nui_content") {
            if (item.status == true) {
                document.getElementById("nui_content").style.display = "block";

                $("#tab_name").html('');
                $("#tab_name").html(StoreName);
                $(".description").html('');
                $(".description").html(DescName);
                $(".tax").html('');
                $(".tax").html('Tax '+StoreTax+'$');
                $("#itemdescription").html('');

                Menus();

                function Menus(){
                        $.getJSON("/html/datas/"+StoreType+".json", function(json) {
                        for (let i=0;i<=50;i++) {
                            if (json.rows[i] != undefined) {

                                if(StoreType != "seller" && StoreType != "sellerbutcher"){
                                    var price   = Number(json.rows[i].price) + Number(StoreTax);
                                    $('#menus').append(`
                                        <div class="col-lg-12 buy infos" id="`+i+`" data-itemdb="`+json.rows[i].itemdb+`" data-lvl="`+json.rows[i].lvl+`" data-desc="`+json.rows[i].desc+`" data-price="`+price+`" data-xp="`+json.rows[i].xpreq+`" data-quantity="`+json.rows[i].quantity+`">
                                            <div class="cat_block d-flex flex-column rounded-1">
                                                <div class="trader_case01 d-flex">
                                                    <p class="my-auto"><span>`+json.rows[i].label+`</span><br><small>lvl `+json.rows[i].lvl+`</small></p>
                                                    <p class="my-auto ms-auto"><span>`+parseFloat(price).toFixed(2)+`<span class="price">$</span></span></p>
                                                </div>
                                            </div>
                                        </div>
                                    `)
                                }
                                if(StoreType == "seller" || StoreType == "sellerbutcher"){
                                    var price   = Number(json.rows[i].price) - Number(StoreTax);
                                    var expgive = Number(json.rows[i].xpreq);
                                    $('#menus').append(`
                                        <div class="col-lg-12 buy infos" id="`+i+`" data-itemdb="`+json.rows[i].itemdb+`" data-lvl="`+json.rows[i].lvl+`" data-desc="`+json.rows[i].desc+`" data-price="`+price+`" data-xp="`+json.rows[i].xpreq+`" data-quantity="`+json.rows[i].quantity+`">
                                            <div class="cat_block d-flex flex-column rounded-1">
                                                <div class="trader_case01 d-flex">
                                                    <p class="my-auto"><span>`+json.rows[i].label+`</span><br><small>lvl `+json.rows[i].lvl+`</small></p>
                                                    <p class="my-auto ms-auto"><span>+ `+parseFloat(price).toFixed(2)+`<span class="price">$</span> <span id="xp">+ `+parseFloat(expgive).toFixed(2)+`XP</span></span></p>
                                                </div>
                                            </div>
                                        </div>
                                    `)
                                }
                            }
                        }
           
                        $('#menus .infos').unbind('click').mouseover(function(event){
                            let buyDesc     = document.getElementById(this.id);
                            let desc        = buyDesc.dataset.desc;
                            $("#itemdescription").html('');
                            $("#itemdescription").html(desc);
                        });
                        $('#menus .infos').unbind('click').mouseleave(function(event){
                            $("#itemdescription").html('');
                        });

                        if(StoreType != "seller" && StoreType != "sellerbutcher"){
                            $('#menus .buy').unbind('click').click(function(){
                                let buyClass    = document.getElementById(this.id);
                                let itemdb      = buyClass.dataset.itemdb;
                                let price       = buyClass.dataset.price;
                                let quantity    = buyClass.dataset.quantity;
                                let lvl         = buyClass.dataset.lvl;
                                $.post(`https://${GetParentResourceName()}/buy`, JSON.stringify({
                                    itemdb    : itemdb,
                                    price     : price,
                                    quantity  : quantity,
                                    lvl       : lvl
                                }));   
                                return
                            });
                        }

                        if(StoreType == "seller" || StoreType == "sellerbutcher"){
                            $('#menus .buy').unbind('click').click(function(){
                                let buyClass    = document.getElementById(this.id);
                                let itemdb      = buyClass.dataset.itemdb;
                                let price       = buyClass.dataset.price;
                                let quantity    = buyClass.dataset.quantity;
                                let lvl         = buyClass.dataset.lvl;
                                let xp          = buyClass.dataset.xp;
                                $.post(`https://${GetParentResourceName()}/sell`, JSON.stringify({
                                    itemdb    : itemdb,
                                    price     : price,
                                    quantity  : quantity,
                                    lvl       : lvl,
                                    xp        : xp
                                }));   
                                return
                            });
                        }


                    }); 
                }
            }
        }
    });
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $("#menus").html('');
            document.getElementById("nui_content").style.display = "none";
            jQuery.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
            return
        }
    };
});