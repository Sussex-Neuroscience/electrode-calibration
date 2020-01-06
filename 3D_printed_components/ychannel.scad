


$fn=30;
tol=0.1;


//channels dimensions
channelx = 25.4;
channely = 3;
channelz = 3;

shortarmx = 15;
shortarmy = channely-1;



// fluid line dimensions
flined = 5;

//electrode holder dimensions
polyamided = 0.78;
polyamideh  = channelz/2;
plasticholderd = 4.42;
plasticholderh = (channelz+1)/2;
//////////////////////////////////////////////////

/////////// modules /////////////////////////////

module screwbit(diam1,diam2,height1,height2){
    union(){
    cylinder(d=diam1,h=height1);
    translate([0,0,height1-0.01]){
        cylinder(d=diam2,h=height2);
    }//end translate
}//end union
    }//end module screwbit  
///

module yshape(shortarmx=shortarmx,shortarmy=shortarmy,longarmx=channelx,longarmy=channely,z=channelz,holes=0){
    
    rotate([0,0,45]){
        translate([-shortarmy,0,0]){
            cube([shortarmx,shortarmy,z]);
            if (holes==1){
                translate([shortarmx-2,shortarmy/2,z-.5]){
                    screwbit(polyamided+tol,plasticholderd,polyamideh,plasticholderh);
                }//end translate
            }//end if
        }//end translate
    }//end rotate

    mirror([0,1,0]){
        rotate([0,0,45]){
            translate([-shortarmy,0,0]){
                cube([shortarmx,shortarmy,z]);
                if (holes==1){
                    translate([shortarmx-2,shortarmy/2,z-.5]){
                        screwbit(polyamided+tol,plasticholderd,polyamideh,plasticholderh);
                }//end translate
            }//end if
            }//end translate
        }//end rotate
    }//end mirror
    
    translate([0,longarmy/2,0]){
        rotate([0,0,180]){
            cube([longarmx,longarmy,z]);
            if (holes==1){
                translate([longarmx-2,longarmy/2,z-.5]){
                    screwbit(polyamided+tol,plasticholderd,polyamideh,plasticholderh);
                }//end translate
                translate([longarmx/2-2,longarmy/2,z-.5]){
                    screwbit(polyamided+tol,plasticholderd,polyamideh,plasticholderh);
                }//end translate
            }//end if
        }//end rotate
    }//end translate
    
        
        
    
 }//end module
/////
module yshapedring(shortarmx,shortarmy,longarmx,longarmy,ringz,ringt){

    difference(){
       yshape(shortarmx,shortarmy,longarmx,longarmy,ringz,0);
        
        translate([-ringt,0,-1]){
            yshape(shortarmx-2*ringt,shortarmy-2*ringt,longarmx-2*ringt,            longarmy-2*ringt,ringz+2,0);
        }//end translate
    }
 
 }//end module
 ////
 
/////////////////////////////////////////////////
difference(){
    translate([-35,-15,-1]){
        cube([50,30,6.9]);
        
    }//end translate    
    //translate([-35.5,-15.5,-5]){
    //        cube([51,31,6.9]);
    //        }
    yshape(holes=1);
}//end difference
