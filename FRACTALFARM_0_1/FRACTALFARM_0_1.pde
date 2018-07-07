
import themidibus.*; //Import the library

//hello this is a code thing devleoped by andrei jay please share with whomever u may feel would enjoy such a thing.
//feel free to alter and rewrite whatever u wish just send me back a copy so i can see what u did ex.zee.ex@gmail.com
//and if u for some reason feel the urge to take a part or the entire of this thing and make money off off it somehow
//try not to be that person ok
//**the above just refers to don't try to like sell some version of this thing
//if u want to use for live performances or whatever and end up getting paid for that
//thats totally cool


//import processing.video.*;
MidiBus myBus;
//Capture cam1,cam2;

PImage screen;
color cbin,cbinstroke;

int cs=8;//<--------u can change this number if u want, larger numbers run faster and offer less resolution and verse vica.  if you change this u might also want to hit f a couple times when u start i haven't quite ironed out the kinks in cell detection yet  think they need to be even

float cs2,x,y,b2,ff,ss,dd,zz,fly,rr,zoff,gg,hh,jj,kk,s,d,qq,longg,tall,strooke,nostrooke,longgg,talll,sss;
int count,loc,loc2,cap,perl,bin,alph,straight,fill,tt,loc3;
int switc=1;
float xn,yn,zn,skew,hbin,sbin,bbin;
int cols,rows,inc;
//int[] cam1pixels;
//int[] cam2pixels;
float a2,theta,xoff,yoff;
//float p=1.2;
void setup() {
 // size(1280, 960,P3D);
//size(displayWidth, displayHeight,P3D);
//
   size(1000,800,P3D);
  colorMode(HSB,100);
  rectMode(CENTER);
  background(0);
  noCursor();
  
  //initialconditions
  //u can try to fuck with these if u want but i feel like at first these are all decent places to start
  zz=0;
  ss=0;
  inc=1;
  longg=tall=1;
  gg=.5;
  qq=0;
  //dd=100;
  ff=0;
  kk=0;
  hh=.9;
  jj=.9;

  perl=1;
  strooke=1;
  skew=1.0;
  longgg=1;
  talll=1;
  d=30;
  dd=1;
  bin=3;
  cap=1;
  //oh hey u notice that there is midi controlrs available.  there are secret exxxtra controls if u have some knobby usb midi thing
  //xxxxxxxxtra secret controls if u have a korg nanostudio w the xy pad
    MidiBus.list();

myBus = new MidiBus(this, 0, -1);
 // frameRate(15);
 // cols=width/cs;
 // rows=height/cs;

 // String[] cameras = Capture.list();
 

 // if (cameras == null) {
 //   println("Failed to retrieve the list of available cameras, will try the default...");
    //cam = new Capture(this, 640, 480);
 // } if (cameras.length == 0) {
 //   println("There are no cameras available for capture.");
 //   exit();
 // } else {
   
   
 //  println("Available cameras:");
//   printArray(cameras);

    // The camera can be initialized directly using an element
    // from the array returned by list(): 
    
    
    //got to fuck around with the list() 2 get the numbers right l
  //  cam2 = new Capture(this, cameras[15]);
   //  cam1 = new Capture(this, cameras[144]);
  //   cam1pixels=new int[width*height];
  //cam2pixels=new int[width*height];
    
    
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
  //  cam1.start();
    //cam2.start();
 // }
 
 
 //having nosmooth on gives u a janky harsh moire noise mess thing and also helps the code run faster.  if u have super gaming computer
 //and want to see smooth and creamy moire instead just //the nosmooth out or replace with smooth(SOME INTEGER HERE) and see what heppens
 noSmooth();
}

void draw() {
  //if u want just some xxxtra chaos undelete the slashses below
  //skew =1 +random(0,1)*cos(theta/5*sin(theta/79+cos(theta/83)-sin(theta/11)));

  translate(width/2,height/2,zz);
  //rotateY(xn*.009);
 //  rotateX(yn*.009);
   rotateZ(zn*.0127*4);
   
   //this loads the seed image.  secret bonus : you can just drop any image file into the sketch folder and rename seed.tif with whatever
   //file u dropped
  if(count==0){screen=loadImage("seed.tif");}
  
  //the skeleton of this algorithm are just plain and simple: take a screenshot of each frame and then use that frame as the seed for the next
  else{ screen=loadImage("read.tif");}
  
  screen.loadPixels();
  int[] imagepixels;
  imagepixels=new int[screen.width*screen.height];
//  println("imagepixels size"+screen.width*screen.height);
  for(int i=0;i<screen.width;i++){
    imagepixels[i]=screen.pixels[i];
    
  
  }//endifor
  
  
  //obviously thhis had capabilities to swtich to camera input at one point;  feel free to try to turn it back on if u want its kind 
  //of a pain and not as immediately entertaining as u might think.  better idea is to run the video out to an external mixer
  //and key out either white or black and then do some feedback on it
 /* 
  if (cam1.available() == true) {
    cam1.read();
   
    cam1.loadPixels();
   for(int i=0;i<cam1.height*cam1.width;i++){
   cam1pixels[i]=cam1.pixels[i];
   }//grabbingone pixelarray
   
  }//endifcam1true
  cellscale=cs*cam1.height/height;
  */
   /*
   cs2=cs*height/cam1.height; 
   
   translate(abs(width-cam1.width)*.25,0,0);
   
    cam2.read();
    cam2.loadPixels();
    for(int j=0;j<cam2.width*cam2.height;j++){
   cam2pixels[j]=cam2.pixels[j];
   }//grabbingtheother pixelarray
   
  }
 
 */
 
 // updatePixels();
  //image(cam1, 0, 0, cam1.width, cam1.height);
 // image(cam2, cam2.width, 0, cam2.width, cam2.height);
  // The following does the same as the above image() line, but 
  // is faster when just drawing the image without any additional 
  // resizing, transformations, or tint.
  //set(0, 0, cam);
  
  
  
  //heres like the main guts of the everything
   // Begin loop for columns
   translate(-width/2,-height/2,0);
   fly-=.1*gg;
   xoff=fly;
    for (int i = 2; i < screen.width/cs-1; i+=inc) {
      
      xoff+=.1*hh;
      yoff=fly;
      for (int j = 2; j < screen.height/cs-1; j+=inc) {
      yoff+=.1*jj;
        
         rr=noise(xoff,yoff,zoff);
         //println("rr="+rr);
         x = i*cs;
         y = j*cs;
         float x2=(i-1*skew)*cs;
         float y2=(j-1*skew)*cs;
          float x3=(i*skew)*cs;
         float y3=(j-1*skew)*cs;
     //  println("x,y="+x+" "+y);
      
         
         //loc is the cell being drawn, loc2 is the comparison cell
         
      //  int loc = (screen.width + int(x+cs/2) - 1) + int(y+cs/2)*screen.width;//look in the middle off the cell
        if(switc==1){
         loc = (screen.width + int(x) - 1) + int(y)*screen.width;//look at the corner of the cell
          loc2 = (screen.width + int(x2) - 1) + int(y2-cs)*screen.width;
           loc3 = (screen.width + int(x3-cs) - 1) + int(y3)*screen.width;
        }//endswtic1
        
        
         if(switc==2){
          loc = (screen.width + int(x+cs/2) - 1) + int(y+cs/2)*screen.width;//look in the middle off the cell

          loc2 = (screen.width + int(x2+cs/2) - 1) + int(y2+cs/2)*screen.width;//look in the middle off the cell
          loc3 = (screen.width + int(x3-cs/2) - 1) + int(y3+cs/2)*screen.width;
        }//endswtic2
        
        //grab out a bunch of pixel information
        float h1=hue(screen.pixels[loc]);
        float s1=saturation(screen.pixels[loc]);
        float b1=brightness(screen.pixels[loc]);
        float a1=b1;
        float z1=b1/2;
          
        float h2=hue(screen.pixels[abs(loc2)%(width*height)]);
        float s2=saturation(screen.pixels[abs(loc2)%(width*height)]);
        float b2=brightness(screen.pixels[abs(loc2)%(width*height)]);
        //float a2=b2;
       
        float b3=brightness(screen.pixels[abs(loc3)%(width*height)]);
    
     //  println("values are"+h1+" "+s1+" "+b1);
        
        pushMatrix();
       
        translate(i*cs+cs/2,j*cs+cs/2,0);
        
        //heres the perlin noise clouds add a threshold control here
         if(perl==1){
        //the perlin noise is default switched to on in this sketch.  its there to give u plenty of random motion figure out techniques with and also because it is soothing
        //did i mention at all that this is a feedback machine?  it is possible to emulate a lot of the effects u see in analog video
        //feedback systems but def helps with the midi controller.  once you feel like u get the hang of controls a bit try switching this on and off with '5' and '6'
         if(rr>.6){
         s1=abs(100-s1);
         s2=abs(100-s2);
         b1=100-b1;
         b2=100-b2;
         b3=100-b3;
         translate(0,0,rr*ss);
         }//endiffrr
       }//endifperl
    
    
    //switch for alpha control
    if(alph==1){
     a1=d*(1+.5*(sin(theta/56)+cos(theta*.079)));
    }
    
    //make some color devices
      color c1=color(h1,s1,b1,a1);
      color c2=color(h2,s2,b2,a2);
      fill(c1);
      
      //if u hit the number '7' key and then hold down 'k' for a bit you will get into the blob zone
      
      
      //some rule sets
    if(bin==0){
        if(b1>b2){translate(cs*dd,0,cs*ss); fill(h1,s1,(100-b1)%100,a1); stroke(b1);}
        if(b1<b2){translate(0,cs*dd,cs*ss);}
        if(b1==b2){translate(0,0,cs*ss);fill(h1,s1,abs(b1-b2)/2,a1);stroke(100-b2);}
        if(b1<b3){translate(0,cs*dd,-cs*ss); fill(h1,s1,abs(100-b2),a1); stroke((b3-b2)/2);}
        if(b1>b3){translate(cs*dd,0,-cs*ss);}
        if(b1==b3){translate(cs*dd,cs*dd,-cs*ss);fill(h1,s1,(b3+b2+b1)%100,a1);stroke(100-b3);}
        
    }//endifbin0
    
    
    //heres some things that just do bitwise binary operations on the color data of the cells
    
    if(bin==1){
    cbin=c1^c2;
   hbin=hue(cbin)%100;
   sbin=saturation(cbin)%100;
   bbin=brightness(cbin)%100;
    cbin=color(hbin,sbin,bbin,a1);
    
    fill(cbin);
    if(tt==1){
    cbinstroke=color((hbin-100)%100,(sbin-100)%100,(bbin-100)%100);
    stroke(cbinstroke);
    }
    }//endifbin1
    
      if(bin==2){
    cbin=c1|c2;
     hbin=hue(cbin);
   sbin=saturation(cbin);
   bbin=brightness(cbin);
    cbin=color(hbin,sbin,bbin,a1);
    
    fill(cbin);
    if(tt==1){
     cbinstroke=-c1|c2;
     stroke(cbinstroke);
    }
    }//endifbin2
    
     if(bin==3){
       
       //lots of sierpinski triangles hang out in the bitwise & chaos.  play around in here and then zoom in with 'a' key to discover depths of fractal triangls
       //println("wftcbin3");
    cbin=c1&c2;
     hbin=hue(cbin);
   sbin=saturation(cbin);
   bbin=brightness(cbin);
    cbin=color(hbin,sbin,bbin,a1);
   
   // float hh=hue(cbin);
   
    fill(cbin);
    
    }//endifbin2
    if(tt==1){
     //fuck it rainbow mode.  if u do this and hit r to remove the strokes then u lose pretty much most all the actual chaos and just have like some hippie raver visuals for a sec
    fill(abs((i-screen.width/(2*cs))*(i-screen.width/(2*cs))*cos(log(y/17)*theta/831-sin(theta*951))*hbin/50-cos(log(x/13)*theta*.931+cos(theta*.31))*(j-screen.height/(2*cs))*(j-screen.height/(2*cs))*sbin/80)%100,100,100,d);
    }
    
    if(fill==1){noFill();}//endifill
    
      strokeWeight(strooke+kk);
       shearX(qq*.0127*1.9);
       shearY(sss*.0127*1.9);
      stroke(abs(100-b1));
        if(nostrooke==1){noStroke();}//endifnostroke
      translate(0,0,ss*b1);
      translate(dd,dd,0);
        if(cap==1){
        fill((b1%30+b2%80)%100,100,100,d);
        stroke((100-(b1%30+b2%80)%100),100,100,d);
       }//endifcap
      //can try turning this back on if u have midi controller that works on skew ask me for details if need
     // rotateZ(ff);
     
    //going to try to use xy pad to make big pixles where u touch i guess?
    /*
    
     if(xn>0&&yn>0){
     if(xn*screen.width/cs<=(i*4)){rect(0,0,cs*10,cs*10);}
     }*/
        rect(0,0,cs*longg*longgg,cs*tall*talll);
      
        //make some floaty outlines
        //change this to some additional CA rules naw?
     
     
       popMatrix();
  
  //b2=b1;//does this even hold relevance anymore?      
      }//endjfor
    }//endifor  
    theta+=.001;
  //  image(screen,0,0);
   // xoff-=theta;
  //  yoff-=theta;
  count+=1;
  if(keyPressed){
   if(key=='-'){count=0;}
   
   
   //these are for the most part increment and decrementing variabls
   if(key=='a'){zz+=10;}
   if(key=='z'){zz-=10;}
   if(key=='s'){ss+=.01;}
   if(key=='x'){ss-=.01;}
   if(key=='d'){dd+=.01;}
   if(key=='c'){dd-=.01;}
   if(key=='f'){ skew+=.05;}//println("skew is"+skew);}
   if(key=='v'){ skew-=.05;}//println("skew is"+skew);}
    if(key=='g'){gg+=.05;}//println("gg is"+gg);}
   if(key=='b'){gg-=.05;}//println("gg is"+gg);}
    if(key=='h'){hh+=.05;}
   if(key=='n'){hh-=.05;}
    if(key=='j'){jj+=.05;}
   if(key=='m'){jj-=.05;}
   if(key=='k'){kk+=.1;}
   if(key=='l'){kk-=.1;}
   if(key==','){longgg+=.1;}
   if(key=='.'){longgg-=.1;}
   if(key==']'){talll+=.1;}
   if(key=='['){talll-=.1;}
   
   
   //theres are like mostly just on off switches nwhatnot
   if(key=='1'){switc=1;}
   if(key=='2'){switc=2;}
    if(key=='3'){cap=1;}
   if(key=='4'){cap=0;}
   if(key=='5'){perl=1;}
   if(key=='6'){perl=0;}
   if(key=='7'){bin=0;}
   if(key=='8'){bin=1;}
    if(key=='9'){bin=2;}
     if(key=='0'){bin=3;}
      if(key=='p'){alph=1;}
   if(key=='o'){alph=0;}
    if(key=='i'){fill=1;}
   if(key=='u'){fill=0;}
     if(key=='y'){tt=1;}
   if(key=='t'){tt=0;}
   
   if(key=='r'){nostrooke=1;}
    if(key=='7'){nostrooke=0;}
   
   
   //dunno about this one tbh
   /*
   if(key=='q'){
   pushMatrix();
   translate(0,0,1);
   noStroke();
   fill(0);
   rect(0,0,displayWidth*2,displayHeight*2);
   popMatrix();
   }//blackout
   */
   //would rather make sure that u can do z swirsl even if u dont have amidi controller!
   if(key=='q'){zn+=1;};
   if(key=='`'){zn-=1;};
   
   
   
    if(key=='w'){
   pushMatrix();
   translate(0,0,1);
   noStroke();
   fill(100);
   rect(0,0,displayWidth*2,displayHeight*2);
   popMatrix();
   }//whiteout
     if(key=='e'){
 xn=yn=zn=zz=s=ss=dd=0;
 longg=longgg=talll=1;
 skew=1;
 tall=qq=inc=1;
 
   }//blackout
}//endifkeypressed

 
 
 saveFrame("read.tif");
 //if(count>=10){
 //noLoop();
 //}
}


//midi stuff is all down here if u got diff ccs for yr knobs and don't know how to map em ask me and ill walk u thru it.  highly reccomend with knobs
void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  /*
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  */
  if(number==16){
  xn=(value*.007874+.000002);

 // println("x="+x);
  }
  if(number==17){
  yn=(value*.007874+.000002);
  println(yn);

  //println("x="+x);
  }
    if(number==27){
  zn=(value-63);

  //println("x="+x);
  }
   if(number==26){
  qq=(value);

  //println("x="+x);
  }
   if(number==25){
  d=value*.1;

  //println("x="+x);
  }
  
   if(number==24){
  sss=value;
//inc=int(s+1);
  //println("x="+x);
  }
  
   if(number==23){
 longg=value*.1;
inc=int(s+1);
  //println("x="+x);
  }
   if(number==22){
 tall=value*.1;
inc=int(s+1);
  
  }
  if(number==21){
 strooke=abs(log(value))*1.5+.01;

  }
  
  if(number==20){
 skew=(value)*.1;

  }
}//endcontrollerchange
