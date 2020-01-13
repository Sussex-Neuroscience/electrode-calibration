
///////////////////////////////////////////
// Y CHANNEL microfluidic chamber        //
// to be used for electrode calibration  //
// created by AM Chagas 20191120         //
// CC BY SA v4.0                         //
///////////////////////////////////////////

// fn defines how smooth circles/cylinders will be
$fn=30;

// tol is a parameter to compensate for differences in 
// different 3d printers - higher values make holes bigger
// and looser fits
tol=0.1;

test=0;

//channels dimensions
channelx = 25.4;
channely = 3;
channelz = 0.2;

//dimensions of the "Y" short arms
shortarmx = 15;
shortarmy = channely-1;



// fluid line dimensions
flined = 5;

//electrode holder dimensions
polyamided = 0.6;
polyamideh  = 0.4;//channelz/2;
plasticholderd = 2.83;
plasticholderh = 5;

slity = 0.78+tol;
slitx = 4.23+tol;
// luer fitting
luerh = 3;
luerd = 4.18;//2.3;

//////////////////////////////////////////////////

/////////// modules /////////////////////////////



// module to create a screw like structure
module screwbit(diam1,diam2,height1,height2){
    union(){
    cylinder(d=diam1,h=height1);
    translate([0,0,height1-0.01]){
        cylinder(d=diam2,h=height2);
    }//end translate
}//end union
    }//end module screwbit  
///

module micromanipulatorbase(){
screwbit(polyamided+2*tol,plasticholderd+2*tol,polyamideh,plasticholderh);
translate([0,-slity/2,polyamideh]){
    cube([slitx,slity,plasticholderh]);
    }//end translate
}//end module


// create a Y shape
module yshape(shortarmx=shortarmx,shortarmy=shortarmy,longarmx=channelx,longarmy=channely,z=channelz,holes=0){
    
    rotate([0,0,45]){
        translate([-shortarmy,0,0]){
            cube([shortarmx,shortarmy,z]);
            if (holes==1){
                translate([shortarmx-2,shortarmy/2,channelz/2]){
                    screwbit(channely/4,luerd+2*tol,0.5,luerh);
                }//end translate
            }//end if
        }//end translate
    }//end rotate

    mirror([0,1,0]){
        rotate([0,0,45]){
            translate([-shortarmy,0,0]){
                cube([shortarmx,shortarmy,z]);
                if (holes==1){
                    translate([shortarmx-2,shortarmy/2,channelz/2]){
                        screwbit(channely/4,luerd+2*tol,0.5,luerh);
                }//end translate
            }//end if
            }//end translate
        }//end rotate
    }//end mirror
    
    translate([0,longarmy/2,0]){
        rotate([0,0,180]){
            cube([longarmx,longarmy,z]);
            if (holes==1){
                translate([longarmx-2,longarmy/2,channelz/2]){
                    screwbit(channely/4,luerd+tol,0.5,luerh);
                }//end translate
                translate([longarmx/2-2,longarmy/2,channelz/2]){
                    micromanipulatorbase();
                }//end translate
            }//end if
        }//end rotate
    }//end translate
    
    //drain hole
    translate([-channelx+0.1,0,channelz/2]){
    rotate([0,-90,0]){
        screwbit(diam1=0.8,diam2=luerd+2*tol,height1=2,height2=3);
        }//end rotate
    }//end translate
        
        
    
 }//end module
/////
 
// a ring in Y shape (in case a rubber seal is needed)
module yshapedring(shortarmx,shortarmy,longarmx,longarmy,ringz,ringt){

    difference(){
       yshape(shortarmx,shortarmy,longarmx,longarmy,ringz,0);
        
        translate([-ringt,0,-1]){
            yshape(shortarmx-2*ringt,shortarmy-2*ringt,longarmx-2*ringt,longarmy-2*ringt,ringz+2,0);
        }//end translate
    }
 
 }//end module
 ////
 
 
 
/////////////////////////////////////////////////

difference(){
    translate([-30,-15,-2.5]){
        cube([41,30,channelz+5]);
        
    }//end translate    
    yshape(holes=1);
    if (test==1){
    translate([-30.5,-18.5,-4]){
            cube([30,15,10]);
            }
    translate([-30.5,4,-4]){
            cube([30,15,10]);
            }
    translate([-4,-20,-5]){
            cube([20,40,10]);
            }//endtranslate
        }//end if
        
    
}//end difference
