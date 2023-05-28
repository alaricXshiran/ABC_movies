
//counting booked seats
function checkboxes() {
    var z = document.getElementsByTagName("input"),
            count = 0;
    for (var i = 0; i < z.length; i++) {
        if (z[i].type === "checkbox" && z[i].checked === true) {
            count++;
        }
    }
    document.getElementById("xx").innerHTML = count;
    var price=document.getElementById("movieprice").value;
    document.getElementById("xxx").innerHTML = count*price;
    console.log(price);
    console.log(price*count);
}