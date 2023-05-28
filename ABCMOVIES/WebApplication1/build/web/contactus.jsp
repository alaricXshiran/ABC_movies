<%-- 
    Document   : contactus
    Created on : Jan 12, 2023, 1:18:28 PM
    Author     : Blood
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <link rel="stylesheet" href="./css/contactus.css">
        <title>Contact and review</title>
    </head>
    <body>
    <section id="section-wrapper">
        <div class="box-wrapper">
            <div class="info-wrap">
                <h2 class="info-title">Contact Information</h2>
                <h3 class="info-sub-title">If you wish to contact us via email please fill in the following form and we will get in touch with you at the earliest. </h3>
                <ul class="info-details">
                    <li>
                        <i class="fas fa-phone-alt"></i>
                        <span>Phone:</span> <a href="tel:+94 123 456 78">+ 1235 2355 98</a>
                    </li>
                    <li>
                        <i class="fas fa-paper-plane"></i>
                        <span>Email:</span> <a href="mailto:info@ABCmovies.com">info@ABCmovies.com</a>
                    </li>
                    <li>
                        <i class="fas fa-globe"></i>
                        <span>Website:</span> <a href="#">ABCmovies.com</a>
                    </li>
                </ul>
                <ul class="social-icons">
                    <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                </ul>
            </div>
            <div class="form-wrap">
                <form action="contactus" method="POST">
                    <h2 class="form-title">Let us know what you think</h2><br>
                    <div class="rate">
                            <input type="radio" id="star5" name="rate" value="5" required/>
                            <label for="star5" title="text">5 stars</label>
                            <input type="radio" id="star4" name="rate" value="4" required/>
                            <label for="star4" title="text">4 stars</label>
                            <input type="radio" id="star3" name="rate" value="3" required/>
                            <label for="star3" title="text">3 stars</label>
                            <input type="radio" id="star2" name="rate" value="2" required/>
                            <label for="star2" title="text">2 stars</label>
                            <input type="radio" id="star1" name="rate" value="1" required/>
                            <label for="star1" title="text">1 star</label>
                        </div>
                    <div class="form-fields">
                        <div class="form-group">
                            <input type="text" class="fname" name="fname" required placeholder="First Name" >
                        </div>
                        <div class="form-group">
                            <input type="text" class="lname" name="lname" required placeholder="Last Name" >
                        </div>
                        <div class="form-group">
                            <input type="email" class="email" name="email" required placeholder="Mail">
                        </div>
                        <div class="form-group">
                            <input type="text" class="phone" name="phone" required placeholder="Phone">
                        </div>
                        
                        
                        <div class="form-group">
                            <textarea name="msg"  required placeholder="Write your message"></textarea>
                        </div>
                    </div>
                    
                    <input type="submit" value="Send Review" class="submit-button">
                </form>
            </div>
        </div>
    </section>
</body>
</html>
