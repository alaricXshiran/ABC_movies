function hidepass() {
            var xx = document.getElementById("adminpass");
            if (xx.type === "password") {
                xx.type = "text";
            }
            else {
                xx.type = "password";
            }
        }

