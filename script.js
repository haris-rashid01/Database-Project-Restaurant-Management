
                                $(document).ready(function(){
                                    $('#sidebarToggle').click(function(){
                                        $('.sidebar').toggleClass('hidden'); // Toggle hidden class on sidebar
                                        $('.content').toggleClass('expanded'); // Adjust content area when sidebar is toggled
                                    });

                                    $('.sidebar a').click(function(e){
                                        e.preventDefault(); // Prevent default link behavior
                                        var sectionId = $(this).data('section'); // Get the section id from data attribute
                                        $('.section').removeClass('active'); // Hide all sections
                                        $('#' + sectionId).addClass('active'); // Show the selected section
                                        $('.content h1, .chart-container').addClass('hidden'); // Hide main dashboard content
                                    });

                                    $('#dashboardLink').click(function(e){
                                        e.preventDefault(); // Prevent default link behavior
                                        $('.section').removeClass('active'); // Hide all sections
                                        $('.content h1, .chart-container').removeClass('hidden'); // Show main dashboard content
                                    });

                                    // Initialize Chart.js for sales data
                                    var ctx = document.getElementById('salesChart').getContext('2d');
                                    var salesChart = new Chart(ctx, {
                                        type: 'bar', // Type of chart
                                        data: {
                                            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                                            datasets: [{
                                                label: 'Sales',
                                                data: [3000, 2500, 3200, 4000, 3700, 4500, 5200],
                                                backgroundColor: 'rgba(217, 83, 79, 0.5)',
                                                borderColor: 'rgba(217, 83, 79, 1)',
                                                borderWidth: 1
                                            }]
                                        },
                                        options: {
                                            scales: {
                                                y: {
                                                    beginAtZero: true
                                                }
                                            }
                                        }
                                    });

                                    // Hide all sections initially
                                    $('.section').removeClass('active');
                                    // Show the main dashboard content
                                    $('.content h1, .chart-container').removeClass('hidden');
 });
 
    $(document).ready(function(){
        $('#sidebarToggle').click(function(){
            $('.sidebar').toggleClass('hidden'); // Toggle hidden class on sidebar
            $('.content').toggleClass('expanded'); // Adjust content area when sidebar is toggled
        });

        $('.sidebar a').click(function(e){
            e.preventDefault(); // Prevent default link behavior
            var sectionId = $(this).data('section'); // Get the section id from data attribute
            $('.section').removeClass('active'); // Hide all sections
            $('#' + sectionId).addClass('active'); // Show the selected section
            $('.content h1, .chart-container').addClass('hidden'); // Hide main dashboard content
        });

        $('#dashboardLink').click(function(e){
            e.preventDefault(); // Prevent default link behavior
            $('.section').removeClass('active'); // Hide all sections
            $('.content h1, .chart-container').removeClass('hidden'); // Show main dashboard content
        });

        // Initialize Chart.js for sales data
        var ctx = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(ctx, {
            type: 'bar', // Type of chart
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [{
                    label: 'Sales',
                    data: [3000, 2500, 3200, 4000, 3700, 4500, 5200],
                    backgroundColor: 'rgba(217, 83, 79, 0.5)',
                    borderColor: 'rgba(217, 83, 79, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Function to handle adding a new customer
        $('.btn-primary.add-customer').click(function(){
            // Make AJAX request to server to add customer
            $.ajax({
                url: '/addCustomer',
                type: 'POST',
                data: {
                    // Provide data for adding a customer
                },
                success: function(response){
                    alert(response); // Show success message
                },
                error: function(xhr, status, error){
                    console.error('Error adding customer:', error); // Log error message
                    alert('Error adding customer. Please try again.'); // Show error message
                }
            });
        });

        // Similar functions for other buttons

        // Hide all sections initially
        $('.section').removeClass('active');
        // Show the main dashboard content
        $('.content h1, .chart-container').removeClass('hidden');
    });
    document.getElementById('addCustomerBtn').addEventListener('click', () => {
        // Make a POST request to the server-side endpoint to add a new customer
        fetch('/addCustomer', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                // Include any data you want to send to the server
            })
        })
        .then(response => response.text())
        .then(message => {
            alert(message); // Display the response message from the server
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred. Please try again.'); // Display error message
        });
    });
    $(document).ready(function(){

        // Event listener for "Add Client" button
        $('#clientsSection .btn-primary').click(function(e){
            e.preventDefault();
            const formData = {
                fname: $('#clientsSection input[name="firstName"]').val(),
                lname: $('#clientsSection input[name="lastName"]').val(),
                phone: $('#clientsSection input[name="phone"]').val(),
                email: $('#clientsSection input[name="email"]').val(),
                restaurantId: 'your_restaurant_id' // Set your restaurant ID here
            };
            // Send a POST request to submitCustomer endpoint
            fetch('/submitCustomer', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
            .then(response => response.text())
            .then(data => {
                alert(data); // Show response message
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Error submitting data');
            });
        });

        // Event listener for "Add Order" button
        $('#ordersSection .btn-primary').click(function(e){
            e.preventDefault();
            const formData = {
                customerId: $('#ordersSection input[name="customerId"]').val(),
                noOfItems: $('#ordersSection input[name="noOfItems"]').val(),
                descriptions: $('#ordersSection input[name="descriptions"]').val()
            };
            // Send a POST request to submitOrder endpoint
            fetch('/submitOrder', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
            .then(response => response.text())
            .then(data => {
                alert(data); // Show response message
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Error submitting data');
            });
        });

        // Event listener for "Add Bill" button
        $('#billSection .btn-primary').click(function(e){
            e.preventDefault();
            const formData = {
                orderId: $('#billSection input[name="orderId"]').val(),
                // Include other necessary data for adding a bill
            };
            // Send a POST request to submitBill endpoint
            fetch('/submitBill', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
            .then(response => response.text())
            .then(data => {
                alert(data); // Show response message
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Error submitting data');
            });
        });

        // Add event listeners for other buttons and perform respective tasks

    });

                            