var $psNumber;
var $psUname;
var $psTime;
var $psTelnumber;
var $psAddres;
var $psTotime;
var $siLarge;
var $siItem;
var $siType;
var $siName;
var $siPrice;
var $psPeople;
var $psDesc;
var $accept;
$(function () {
   $psNumber=$("#psNumber");
   $psUname=$("#psUname");
   $psTime=$("#psTime");
   $psTelnumber=$("#psTelnumber");
   $psAddres=$("#psAddres");
   $psTotime=$("#psTotime");
   $siLarge=$("#siLarge");
   $siItem=$("#siItem");
   $siType=$("#siType");
   $siName=$("#siName");
   $siPrice=$("#siPrice");
   $psPeople=$("#psPeople");
   $psDesc=$("#psDesc");
   $accept=$("#accept");
   $accept.click(function(){
       var psNumber=$psNumber.val();
       var psUname=$psUname.val();
       var psTime=$psTime.val();
       var psTelnumber=$psTelnumber.val();
       var psAddres=$psAddres.val();
       var psTotime=$psTotime.val();
       var siLarge=$siLarge.val();
       var siItem=$siItem.val();
       var siType=$siType.val();
       var siName=$siName.val();
       var siPrice=$siPrice.val();
       var psPeople=$psPeople.val();
       var psDesc=$psDesc.val();
       $.post("show/dcl",{psNumber:psNumber,psUname:psUname,psTime:psTime,psTelnumber:psTelnumber,psAddres:psAddres,
           psTotime:psTotime,siLarge:siLarge,siItem:siItem,siType:siType,siName:siName,siPrice:siPrice,psPeople:psPeople,psDesc:psDesc},function (data) {
           $("#psNumber").val(data.psNumber);
           $("#psUname").val(data.psUname);
           $("#psTime").val(data.psTime);
           $("#psTelnumber").val(data.psTelnumber);
           $("#psAddres").val(data.psAddres);
           $("#psTotime").val(data.psTotime);
           $("#siLarge").val(data.siLarge);
           $("#siItem").val(data.siItem);
           $("#siType").val(data.siType);
           $("#siName").val(data.siName);
           $("#siPrice").val(data.siPrice);
           $("#psPeople").val(data.psNpsPeopleumber);
           $("#psDesc").val(data.psDesc);
       })
   });
})
