<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hotel Cendana Resident</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
        <style>

            body {
                background-color: lightslategray;
                font-family: Arial, sans-serif;
            }
            button {
                padding: 15px 25px;
                border: unset;
                border-radius: 15px;
                color: #212121;
                z-index: 1;
                background: #e8e8e8;
                position: relative;
                font-weight: 1000;
                font-size: 17px;
                -webkit-box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
                box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
                transition: all 250ms;
                overflow: hidden;
            }

            button::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                height: 100%;
                width: 0;
                border-radius: 15px;
                background-color: #212121;
                z-index: -1;
                -webkit-box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
                box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
                transition: all 250ms
            }

            button:hover {
                color: #e8e8e8;
            }

            button:hover::before {
                width: 100%;
            }

            body {
                font-family: Arial, sans-serif;
            }
            .carousel-item {
                height: 100vh;
                min-height: 300px;
                background: no-repeat center center scroll;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                position: relative;
            }

            .carousel-caption {
                bottom: 200px;
                z-index: 2;
            }
            .overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 1;
            }
            .carousel-caption h5 {
                font-size: 3em;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin-top: 25px;
                color: #fff;
            }
            .carousel-caption p {
                width: 75%;
                margin: auto;
                font-size: 1.2em;
                color: #fff;
            }
            .carousel-caption .btn {
                text-transform: uppercase;
                border-radius: 0;
                font-size: 1.2em;
                padding: 10px 20px;
                color: #fff;
            }
            .section {
                padding: 60px 0;
            }
            .footer {
                background-color: #343a40;
                color: white;
                padding: 20px 0;
            }
            .footer a {
                color: white;
            }
            .booking-container {
                margin: 50px auto;
                max-width: 800px;
                padding: 30px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: lightslategray;
            }
            .gallery-container {
                background-color: lightslategray;
                overflow-x: scroll;
                white-space: nowrap;
            }
            .gallery-item {
                display: inline-block;
                margin-right: 10px;
            }
            .gallery-item img {
                width: 100%;
                height: auto;
            }
            .room .card {
                transition: transform 0.3s;
                box-shadow: 15px 15px 30px rgb(25, 25, 25);
            }
            .room .card:hover {
                transform: scale(1.05);
                box-shadow: 15px 15px 30px rgb(25, 25, 25);

            }
        </style>
    </head>
    <body>
        <div > 
            <!-- Header -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
                <a class="navbar-brand" href="#">Cendana Hotel</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#facilities">Facilities</a></li>
                        <li class="nav-item"><a class="nav-link" href="#gallery">Gallery</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Booking</a></li>
                    </ul>
                    <a href="login.jsp" class="btn btn-primary">Login</a>
                </div>
            </nav>
            <div class="overflow-x"> 
                <div id="carouselHero" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselHero" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselHero" data-slide-to="1"></li>
                        <li data-target="#carouselHero" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/webResource/hotelView/hotelView1.jpg" class="d-block w-100" alt="Hero Image 1">
                            <div class="overlay"></div>
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Welcome to Cendana Hotel</h5>
                                <p>Experience luxury and comfort</p>
                                <a href="login.jsp" class="btn btn-primary">Book Now</a>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/webResource/hotelView/hotelView2.jpg" class="d-block w-100" alt="Hero Image 2">
                            <div class="overlay"></div>
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Luxury Rooms</h5>
                                <p>Comfortable and spacious</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/webResource/hotelView/hotelView3.jpg" class="d-block w-100" alt="Hero Image 3">
                            <div class="overlay"></div>
                            <div class="carousel-caption d-none d-md-block">
                                <h5>World-class Facilities</h5>
                                <p>Enjoy our premium services</p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselHero" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselHero" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <!-- Hotel Information Section -->
            <section class="section bg-light" id="about">
                <div class="container">
                    <h2 class="text-center">About Our Hotel</h2>
                    <p class="text-center">Welcome to Cendana Hotel</p>
                    <p class="text-center">
                        At Cendana Hotel, we strive to create a haven of tranquility and luxury for our guests. 
                        Nestled in the heart of [Lokasi], our hotel offers a unique blend of modern comfort and 
                        timeless elegance, ensuring an unforgettable stay.
                    </p>
                    <p class="text-center">
                        Founded in 1988, Cendana Hotel began as a humble establishment with a vision to provide 
                        exceptional hospitality. Over the years, we have grown into a premier destination for travelers 
                        from around the world, known for our impeccable service and attention to detail.
                    </p>
                    <p class="text-center">
                        Our mission is to deliver an extraordinary experience that exceeds our guests' expectations. 
                        We are committed to providing personalized service, luxurious accommodations, and world-class 
                        amenities, all while maintaining a warm and welcoming atmosphere.
                    </p>
                    <p class="text-center">
                    <b> Why Choose Us?</b> 
                    <ul class="text-center list-unstyled">
                        <li><strong>Prime Location:</strong> Conveniently located near major attractions and transportation hubs.</li>
                        <li><strong>Exceptional Service:</strong> Our friendly and professional staff is committed to making your stay memorable.</li>
                        <li><strong>Luxurious Comfort:</strong> Enjoy the perfect blend of luxury and comfort in our well-appointed accommodations.</li>
                        <li><strong>Memorable Experiences:</strong> Create lasting memories with our unique offerings and curated experiences.</li>
                    </ul>
                    </p>
                    <p class="text-center">
                        We look forward to welcoming you to Cendana Hotel and providing you with an exceptional stay. 
                        Thank you for choosing us as your home away from home.
                    </p>
                </div>
            </section>
            Ï

            <!-- Facilities Section -->
            <section class="section" id="facilities">
                <div class="container">
                    <h2 class="text-center">Our Facilities</h2>
                    <div class="row">
                        <div class="col-md-4 text-center">
                            <i class="fas fa-swimming-pool fa-3x"></i>
                            <h4>Swimming Pool</h4>
                            <p>Enjoy a refreshing dip in our crystal-clear swimming pool, perfect for relaxation and leisure.</p>
                        </div>
                        <div class="col-md-4 text-center">
                            <i class="fas fa-spa fa-3x"></i>
                            <h4>Spa & Wellness</h4>
                            <p>Rejuvenate your body and mind with our extensive range of spa treatments and wellness services.</p>
                        </div>
                        <div class="col-md-4 text-center">
                            <i class="fas fa-utensils fa-3x"></i>
                            <h4>Restaurant</h4>
                            <p>Savor delicious meals prepared by our talented chefs, featuring both local and international cuisine.</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 text-center">
                            <i class="fas fa-dumbbell fa-3x"></i>
                            <h4>Fitness Center</h4>
                            <p>Stay fit and healthy during your stay with our state-of-the-art fitness center, equipped with the latest exercise machines.</p>
                        </div>
                        <div class="col-md-4 text-center">
                            <i class="fas fa-concierge-bell fa-3x"></i>
                            <h4>Concierge Service</h4>
                            <p>Our dedicated concierge team is available 24/7 to assist you with all your needs, from booking tours to arranging transportation.</p>
                        </div>
                        <div class="col-md-4 text-center">
                            <i class="fas fa-parking fa-3x"></i>
                            <h4>Parking</h4>
                            <p>We offer ample parking space for our guests, ensuring convenience and peace of mind during your stay.</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Photo Gallery Section -->
            <section id="gallery" class="section bg-light mt-5">
                <div class="container">
                    <h2 class="text-center">Photo Gallery</h2>
                    <div class="gallery-container mt-4">
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/webResource/typeRoom/room1.jpg" class="img-fluid" alt="Room 1">
                        </div>
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/webResource/facility/swimingPool.jpg" class="img-fluid" alt="Room 2">
                        </div>
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/webResource/hotelView/hotelView1.jpg" class="img-fluid" alt="Room 2">
                        </div>
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/webResource/hotelView/hotelView5.jpg" class="img-fluid" alt="Room 3">
                        </div>
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/webResource/hotelView/hotelView3.jpg" class="img-fluid" alt="Room 3">
                        </div>
                    </div>
                </div>
            </section>

            <div class="container mt-5">
                <h2 class="text-center mb-5">Our Rooms</h2>
                <div class="row">
                    <!-- Room 1 -->
                    <div class="col-md-4 room">
                        <div class="card">
                            <img src="${pageContext.request.contextPath}/webResource/typeRoom/roomDeluxeView.jpg" class="img-fluid" alt="Room 1">
                            <div class="card-body">
                                <h5 class="card-title">Deluxe Room</h5>
                                <p class="card-text">Enjoy a luxurious stay in our Deluxe Room, featuring comfortable beds, modern amenities, and a stunning view.</p>
                            </div>
                        </div>
                    </div>
                    <!-- Room 2 -->
                    <div class="col-md-4 room">
                        <div class="card">
                            <img src="webResource/typeRoom/room1.jpg" class="card-img-top" alt="Suite Room">
                            <div class="card-body">
                                <h5 class="card-title">Suite Room</h5>
                                <p class="card-text">Experience the ultimate in luxury in our Suite Room, with spacious living areas, premium furnishings, and top-notch service.</p>
                            </div>
                        </div>
                    </div>
                    <!-- Room 3 -->
                    <div class="col-md-4 room">
                        <div class="card">
                            <img src="webResource/typeRoom/room3.jpg" class="card-img-top" alt="Family Room">
                            <div class="card-body">
                                <h5 class="card-title">Family Room</h5>
                                <p class="card-text">Perfect for families, our Family Room offers ample space, kid-friendly amenities, and a welcoming atmosphere.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer text-center">
                <div class="container">
                    Privacy Policy | Terms of Service
                </div>
            </footer>

            <!-- Bootstrap JS, Popper.js, and jQuery -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        </div>
    </body>
</html>

