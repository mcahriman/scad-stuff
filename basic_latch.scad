module latch( base_width=5, base_height=10, latch_height=5, latch_angle=10, latch_width=15)
{
    //here we draw 2d latch using parameters
    dots = [
        // first dot is zero
        [0,0],
        // then we go forward on x axis 
        // for the base width
        [base_width,0],
        // Up to the upper corner
        // from opposite corner of latch
        [base_width, base_height+latch_height],
        
        //to the angle of the latch
        [0, base_height+latch_height],
    
        //and to to the latch corner dot
        //simplest ever trigonomtry is used here
        //width of the latch itself is it's
        //height times sin(it's angle in degrees)
        [ -base_height*sin(latch_angle),base_height ],
        // corner
        [ 0,base_height]
    ];
    //extrude it to desired latch width
    linear_extrude(latch_width)
        polygon(dots);
}

latch();