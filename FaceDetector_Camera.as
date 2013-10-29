package 
{
	 /**
* @author 	 Asim Kh
* @contact - asimkh@hotmail.com
*/
	import com.quasimondo.bitmapdata.CameraBitmap;
	import nl.stroep.utils.*;

	import flash.events.*;
	import flash.net.*;

	import fl.transitions.*;
	import fl.transitions.easing.*;

	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.navigateToURL;

	import com.greensock.*;
	import com.greensock.easing.*;

	import com.adobe.images.JPGEncoder;
	import com.adobe.images.PNGEncoder;
	import flash.net.FileReference;
	import flash.utils.ByteArray;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.media.Camera;
	import flash.text.TextField;
	import flash.net.FileReference;
	import flash.events.*;
	import flash.text.*;

	import jp.maaash.ObjectDetection.ObjectDetector;
	import jp.maaash.ObjectDetection.ObjectDetectorEvent;
	import jp.maaash.ObjectDetection.ObjectDetectorOptions;

	import mx.core.BitmapAsset;


	public class FaceDetector_Camera extends Sprite
	{

		private var detector:ObjectDetector;
		private var detector2:ObjectDetector;
		private var options:ObjectDetectorOptions;
		private var ClipX:Number;
		private var ClipY:Number;
		private var ClipW:Number;
		private var ClipH:Number;

		private var view:Sprite;
		private var picview:Sprite;
		private var newMask:Sprite;
		private var faceRectContainer:Sprite;
		private var faceRectContainer2:Sprite;
		private var tf:TextField;
		private var header:URLRequestHeader;
		private var jpgURLRequest:URLRequest;

		private var camera:CameraBitmap;
		private var camera2:CameraBitmap;
		private var detectionMap:BitmapData;
		private var detectionMap2:BitmapData;
		private var snapshot:BitmapData;
		private var snapshotLarge:BitmapData;
		private var imgshot:BitmapData;
		private var jpgSource:BitmapData;
		private var mypreview:Bitmap;
		private var largepreview:Bitmap;
		private var clip:Bitmap;
		private var drawMatrix:Matrix;
		private var drawMatrix2:Matrix;
		private var rotateMatrix:Matrix;
		private var scaleFactor:int = 6;
		private var w:int = 640;
		private var h:int = 480;
		private var pw:int = 390;
		private var ph:int = 293;
		private var byteArray:ByteArray;
		private var byteArray2:ByteArray;
		private var byteArray3:ByteArray;
		private var ba:ByteArray;
		private var fileReference:FileReference = new FileReference();
		private var jpgEncoder:JPGEncoder;
		private var pngEncoder:JPGEncoder;
		private var fileRef:FileReference;
		private var i:Number = 1;
		private var img:Number;
		private var imgW:Number;
		private var theTextField:TextField;
		private var msgSent:TextField;
		private var messageTextField:TextField;
		public var heremessage:String;
		public var fileName:String;
		public var friendName_Content:String;
		public var friendEmail_Content:String;
		private var urlLoader:URLLoader;
		private var variables:URLVariables;



		public var yourName_Content:String;
		public var yourEmail_Content:String;
		public var statusMsg:String;

		private var jpg:BitmapData;

		private var yourName:TextField = new TextField();
		private var yourEmail:TextField = new TextField();
		private var friendName:TextField = new TextField();
		private var friendEmail:TextField = new TextField();


		//
		private var myFirstTextBox:TextField = new TextField();
		private var OutputBox:TextField = new TextField();
		private var c_btn: cancel_btn = new cancel_btn();
		private var smallcam_btn: gcam_btn = new gcam_btn();
		private var scr_bg1:screen1 = new screen1();

		private var pinkCap:bt_m = new bt_m();
		private var yellowCap:bt2_m = new bt2_m();
		private var greenCap:bt3_m = new bt3_m();
		private var orangeCap:bt4_m = new bt4_m();
		private var blackCap:bt5_m = new bt5_m();
		private var next_btn:preview_btn = new preview_btn();
		private var bkBtn:back_btn = new back_btn();
		private var tk:thk = new thk();
		private var fb_btn:fb = new fb();
		private var tw_btn:tw = new tw();
		private var new_btn:ncard = new ncard();
		private var rsend_btn:scard = new scard();


		private var imageSaver:ImageSaver;
		private var lastTimer:int = 0;

		public var Mask:Loader = new Loader();
		public var ML1_th:Loader = new Loader();
		public var ML2_th:Loader = new Loader();
		public var ML3_th:Loader = new Loader();
		public var ML4_th:Loader = new Loader();
		public var email_th:Loader = new Loader();
		public var mask_th:Loader = new Loader();
		public var new_email:Loader = new Loader();

		public var M1_th:MovieClip = new MovieClip();
		public var M2_th:MovieClip = new MovieClip();
		public var M3_th:MovieClip = new MovieClip();
		public var M4_th:MovieClip = new MovieClip();
		public var cust_text:MovieClip = new MovieClip();
		public var email_view:MovieClip = new MovieClip();
		public var email_view2:MovieClip = new MovieClip();
		public var mask_view:MovieClip = new MovieClip();
		public var picturetaken:MovieClip = new MovieClip();


		public var screenshot:MovieClip = new MovieClip();
		public var newScreen:MovieClip = new MovieClip();
		public var myvideo:MovieClip = new MovieClip();
		public var scr_bg2:screen2 = new screen2();
		public var md_btn:modify_btn = new modify_btn();
		public var sendBtn:send_btn = new send_btn();
		public var sorry:sorrymsg = new sorrymsg();
		public var ani:atxt = new atxt();

		[Embed('assets/start_cam.jpg')]
		private var messageSrc:Class;

		[Embed('assets/no_cam.jpg')]
		private var webcamErrorSrc:Class;

		private var error:BitmapAsset;
		private var masksArray:Array = new Array();

		public function FaceDetector_Camera()
		{


			initUI();
			initDetector();

			Mask.x = 50;
			Mask.y = 100;


			// Text Format
			var myFont = new chalk();
			var myFormat:TextFormat = new TextFormat();
			myFormat.rightMargin = 3;
			myFormat.leftMargin = 3;
			//myFormat.indent = 10;
			//myFormat.leading = 5;

			
			myFormat.size = 30;
			myFormat.font = myFont.fontName;
			
			//creating text filed
			theTextField= new TextField();
			theTextField.defaultTextFormat = myFormat;
			theTextField.type = TextFieldType.INPUT;
			theTextField.border = true;
			theTextField.width = 270;
			theTextField.height = 80;
			theTextField.x = 630;
			theTextField.y = 310;
			theTextField.multiline = true;
			theTextField.background = true;
			theTextField.wordWrap = true;
			theTextField.maxChars = 90;
			


			addChild(theTextField);
			theTextField.visible = true;

			//screenShot before mask
			addChild(screenshot);
			//mask top of video
			new_email.load(new URLRequest("assets/email_frame2.png"));

			mask_th.load(new URLRequest("assets/mask_frame.png"));
			mask_view.addChild(mask_th);
			addChild(mask_view);
			mask_view.visible = true;


			//screen for balls
			addChild(scr_bg1);
			scr_bg1.x = 0;
			scr_bg1.y = 0;

			//click picture button
			addChild(smallcam_btn);
			smallcam_btn.buttonMode = true;
			smallcam_btn.x = 388;
			smallcam_btn.y = 285;
			smallcam_btn.visible == true;
			smallcam_btn.addEventListener(MouseEvent.CLICK, pictureClick);


			//cancel picture btn
			addChild(c_btn);
			c_btn.buttonMode = false;
			c_btn.visible = false;
			c_btn.x = 368;
			c_btn.y = 288;
			c_btn.addEventListener(MouseEvent.CLICK, hideClick);

			//load mask buttons
			addChild(pinkCap);
			pinkCap.buttonMode = true;
			pinkCap.visible = true;
			pinkCap.x = 485;
			pinkCap.y = 136;
			pinkCap.name = "assets/pink.png";
			pinkCap.buttonMode = true;
			pinkCap.addEventListener(MouseEvent.CLICK, click);

			
			addChild(yellowCap);
			yellowCap.visible = true;
			yellowCap.buttonMode = true;
			yellowCap.x = 555;
			yellowCap.y = 136;
			yellowCap.name = "assets/red.png";
			yellowCap.buttonMode = true;
			yellowCap.addEventListener(MouseEvent.CLICK, click4);

			addChild(greenCap);
			greenCap.buttonMode = true;
			greenCap.x = 625;
			greenCap.y = 136;
			greenCap.name = "assets/green.png";
			greenCap.buttonMode = true;
			greenCap.addEventListener(MouseEvent.CLICK, click);

			//var orangeCap:bt4_m = new bt4_m();
			addChild(orangeCap);
			orangeCap.buttonMode = true;
			orangeCap.x = 695;
			orangeCap.y = 136;
			orangeCap.name = "assets/yellow.png";
			orangeCap.buttonMode = true;
			orangeCap.addEventListener(MouseEvent.CLICK, click);

			//var blackCap:bt5_m = new bt5_m();
			addChild(blackCap);
			blackCap.buttonMode = true;
			blackCap.x = 765;
			blackCap.y = 136;
			blackCap.name = "assets/black.png";
			blackCap.buttonMode = true;
			blackCap.addEventListener(MouseEvent.CLICK, click3);


			md_btn.buttonMode = true;
			md_btn.x = 600;
			md_btn.y = 400;
			md_btn.addEventListener(MouseEvent.CLICK, modify);


			sendBtn.x = 407;
			sendBtn.y = 366;
			sendBtn.addEventListener(MouseEvent.CLICK, emailNow);
			

			//Preview Button
			addChild(next_btn);
			next_btn.visible = true;
			next_btn.buttonMode = true;
			next_btn.x = 407;
			next_btn.y = 366;
			next_btn.addEventListener(MouseEvent.CLICK, saveit);
			
			screenshot.tabEnabled = false;
			scr_bg2.tabEnabled = false;
			scr_bg1.tabEnabled = false;
			
			picturetaken.visible==false
			
			
			//Preview Button

			
			addChild(fb_btn);
			fb_btn.buttonMode = true;
			fb_btn.x = 874;
			fb_btn.y = 464;
			fb_btn.addEventListener(MouseEvent.CLICK, fb_action);
			
			addChild(tw_btn);
			tw_btn.buttonMode = true;
			tw_btn.x = 919;
			tw_btn.y = 464;
			tw_btn.addEventListener(MouseEvent.CLICK, tw_action);
			

		}




		private function initUI():void
		{

			view = new Sprite  ;
			addChild( view );
			view.x = 50;
			view.y = 100;

			//Add Video to stage
			addChild(myvideo);

			error = new webcamErrorSrc();
			addChild( error );
			error.x = 50;
			error.y = 0;



			if (Camera.getCamera())
			{

				camera = new CameraBitmap(488,366,30,w,h);
				camera.addEventListener( Event.RENDER, cameraReadyHandler );
				myvideo.addChild( new Bitmap( camera.bitmapData ));

				//video height and axis
				myvideo.x = 50;
				myvideo.y = 65;
				myvideo.width = 390;
				myvideo.height = 293;

				view.x = 50;
				view.y = 100;

				detectionMap = new BitmapData(w / scaleFactor,h / scaleFactor,false,0);
				drawMatrix = new Matrix(1 / scaleFactor,0,0,1 / scaleFactor);
				drawMatrix2 = new Matrix(5 / scaleFactor,0,0,5 / scaleFactor);

				snapshot = new BitmapData(myvideo.width,myvideo.height,false,0xFFFFFFFF);
				snapshotLarge = new BitmapData(308,230,false,0xFFFFFFFF);
				imgshot = new BitmapData(w,h,false,0xFFFFFFFF);

				faceRectContainer = new Sprite  ;
				//myvideo.addChild(faceRectContainer);

				sorry.visible = false;
				next_btn.visible = true;
				pinkCap.visible = true;
				yellowCap.visible = true;
				greenCap.visible = true;
				orangeCap.visible = true;
				blackCap.visible = true;
				smallcam_btn.visible = true;
				scr_bg1.visible = true;

			}
			else
			{
				var a:BitmapAsset = new messageSrc();
				addChild( a );
				a.x = 50;
				a.y = 0;

				addChild(sorry);
				sorry.x = 450;
				sorry.y = 187;

				next_btn.visible = false;
				c_btn.visible = false;

				pinkCap.visible = false;
				yellowCap.visible = false;
				greenCap.visible = false;
				orangeCap.visible = false;
				blackCap.visible = false;

				smallcam_btn.visible = false;
				scr_bg1.visible = false;
				theTextField.visible = false;

				screenshot.visible = false;
				mask_view.visible = false;
			}
		}

private function fb_action (e:MouseEvent):void
		{
		//facebook
		var varsShare:URLVariables = new URLVariables();
		var urlFacebookShare:URLRequest = new URLRequest("http://www.facebook.com/sharer.php");
		var loaderFacebook:URLLoader=new URLLoader();
    	varsShare.u = "http://www.charag.com/card/";
   		varsShare.t = "Greeting Card by Charag.com";
    	urlFacebookShare.data = varsShare;
    	urlFacebookShare.method = URLRequestMethod.GET;
		navigateToURL(urlFacebookShare, "_blank");
		
		}
		
		private function tw_action(e:MouseEvent):void
		{
						//tweet
			var path:URLRequest = new URLRequest("http://twitter.com/share");
			var tweetVars = new URLVariables();
			//var loaderTweet:URLLoader=new URLLoader();
			tweetVars.url = "http://www.charag.com/card/";
			tweetVars.text = "Greeting Card by Charag.com";
			path.data = tweetVars;
			path.method = URLRequestMethod.GET;
			navigateToURL(path, "_blank");
			//
	

		}
//add Object on face
		private function click(e:MouseEvent):void
		{
			img = 100;
			imgW = 0;
			Mask.unload();
			Mask.load(new URLRequest(e.currentTarget.name));
			myvideo.addChild(Mask);
	

		}

		private function click2(e:MouseEvent):void
		{
			img = 0;
			imgW = 0;
			Mask.unload();
			Mask.load(new URLRequest(e.currentTarget.name));
			myvideo.addChild(Mask);


		}

		private function click3(e:MouseEvent):void
		{
			img = 80;
			imgW = 40;
			Mask.unload();
			Mask.load(new URLRequest(e.currentTarget.name));
			myvideo.addChild(Mask);


		}

		private function click4(e:MouseEvent):void
		{
			img = 60;
			imgW = 200;
			Mask.unload();
			Mask.load(new URLRequest(e.currentTarget.name));
			myvideo.addChild(Mask);


		}

		private function hideClick(e:MouseEvent):void
		{

			c_btn.buttonMode = false;
			c_btn.visible = false;
			screenshot.visible = false;
			smallcam_btn.visible = true;
			Mask.visible = true;

		}

private function validateEmail(str:String):Boolean {
	var pattern:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
	var result:Object = pattern.exec(str);
	if(result == null) {
		return false;
	}
	return true;
}


		private function emailNow(e:MouseEvent):void
		{

			var pattern:RegExp=/(^[a-zA-Z0-9_]+@[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[a-zA-Z]{2,6})/;

						friendName_Content = friendName.text;
						friendEmail_Content = friendEmail.text;
						yourName_Content = yourName.text;
						yourEmail_Content = yourEmail.text;
			
					if(	friendName.text != ""  && friendEmail.text != ""
						&& yourName.text != "" && yourEmail.text != ""
						&& pattern.test(yourEmail.text)
						&& pattern.test(friendEmail.text)
						
						)
    {
        //    enable btn
        sendBtn.enabled = true;
		screenshot.addChild(mypreview);
		screenshot.x = 0;
		screenshot.y = 0;
		messageTextField.x = 30;
		
			var today_date:Date = new Date();
			var thismonth:uint = today_date.getMonth();
			var today_time;
			var currentTime:Date = new Date();
			var minutes = currentTime.getMinutes();
			var seconds = currentTime.getSeconds();
			var hours = currentTime.getHours() * 30 + currentTime.getMinutes() / 2;

			var mnth:Array = new Array('January','February','March','April','May','June','July','August','September','October','November','December');
			var fileName:String = (today_date.getDate()+mnth[thismonth]+today_date.getFullYear()+"_"+currentTime.hours + currentTime.minutes + currentTime.seconds);
			//trace(date_str);

			screenshot.visible = false;
			scr_bg2.visible = false;
			screenshot.visible = false;
			mask_view.visible = false;
			scr_bg1.visible = false;
			c_btn.visible = false;
			smallcam_btn.visible = false;
			pinkCap.visible = false;
			yellowCap.visible = false;
			greenCap.visible = false;
			blackCap.visible = false;
			orangeCap.visible = false;
			myvideo.visible = false;
			theTextField.visible = false;
			next_btn.visible = false;
			c_btn.visible = false;
			error.visible = false;
			
			if (picturetaken.visible == true)
			{
			//removeChild(error);
			addChild(tk);
			tk.visible = true;
			tk.x = 412;
			tk.y = 285;
			
			//back button
			/*addChild(bkBtn);
			bkBtn.visible = true;
			bkBtn.x = 407;
			bkBtn.y = 366;
			bkBtn.addEventListener(MouseEvent.CLICK, bkfromEmail);*/
			//
			
			//new card
			addChild(new_btn);
			new_btn.visible = true;
			new_btn.x = 243;
			new_btn.y = 330;
			new_btn.addEventListener(MouseEvent.CLICK, NewCapture);
			
			//resend
			addChild(rsend_btn);
			rsend_btn.visible = true;
			rsend_btn.x = 539;
			rsend_btn.y = 330;
			rsend_btn.addEventListener(MouseEvent.CLICK, bkfromEmail);
			
			
			var myFont2 = new chalk();
			var myFormat2:TextFormat = new TextFormat();  
			myFormat2.font = myFont2.fontName;
			myFormat2.align = TextFormatAlign.CENTER;
			myFormat2.color = 0xFFFFFF;   
			myFormat2.size = 30;  
			myFormat2.italic = true;  
			
			
			//creating text filed
			msgSent= new TextField();
			msgSent.defaultTextFormat = myFormat2;
			msgSent.type = TextFieldType.DYNAMIC;
			msgSent.width = 270;
			msgSent.height = 50;
			msgSent.x = 350;
			msgSent.y = 317;
			//msgSent.background = true;
			addChild(msgSent);


			mypreview.x = 0;
			mypreview.y = 50;
			messageTextField.x = 30;

			email_view2.visible = true;
			email_view2.addChild(mypreview);
			email_view2.addChild(new_email);
			email_view2.addChild(messageTextField);
			
			//addChild(email_view2);
			}

			

			jpg = new BitmapData(email_view2.width,email_view2.height);
			var jpgEncoder:JPGEncoder = new JPGEncoder(90);
			var jpgStream:ByteArray = jpgEncoder.encode(jpg);
			jpg.draw(email_view2);
//Send mail
			var pixels:Array = new Array();
			for (var xx:uint = 0; xx <= email_view2.width; xx++)
			{
				for (var yy:uint = 0; yy <= email_view2.heightt; yy++)
				{
					pixels.push( jpg.getPixel32(xx, yy).toString(16) );
				}
			}
			
			

		

			var variables:URLVariables = new URLVariables();
			var urlreq:URLRequest = new URLRequest("send.php");
			var loader:URLLoader=new URLLoader();


			//Loader
			loader.dataFormat = URLLoaderDataFormat.VARIABLES;
			loader.addEventListener(Event.COMPLETE,messageSent);
			try
			{

				loader.load(urlreq);
				//loaderFacebook.load(urlFacebookShare);
				//loaderTweet.load(path);

			}
			catch (error:Error)
			{

				trace('Unable to load requested document.');

			}

			variables.friend_name = friendName_Content;
			variables.friend_email = friendEmail_Content;
			variables.your_name = yourName_Content;
			variables.your_email = yourEmail_Content;
			variables.imgname = fileName + ".jpg";

			urlreq.data = variables;
			urlreq.method = URLRequestMethod.POST;
			loader.load( urlreq );
			trace(urlreq.data);

			var imageSaver:ImageSaver = new ImageSaver("images/save-my-image.php");
			imageSaver.save( email_view2, fileName+".jpg" );
		

		
		
		
    } else {
        //    diable
        sendBtn.enabled = false;
		friendName.text = "enter your friend's name";
		friendEmail.text = "enter your friend's email";
		yourName.text= "enter your name";
		yourEmail.text= "enter your email";
    }
			
		

		}




		private function messageSent(evt:Event):void
		{
			var loader:URLLoader = URLLoader(evt.target);
			var vars:URLVariables = new URLVariables(loader.data);
			if (vars.answer == "ok")
			{
				msgSent.text  = "Message has been sent";
			}
			else
			{
				msgSent.text  = "Message not sent";
			}
		}



private function NewCapture(e:MouseEvent):void
		{
			//removing last screen of email
			removeChild(rsend_btn);
			removeChild(new_btn);
			removeChild(tk);
			removeChild(msgSent);
			tk.visible = false;
			rsend_btn.visible = false;
			new_btn.visible = false;
			email_view2.visible = false;
			
			//displaying main screen
			c_btn.visible = false;
			screenshot.visible = false;
			
			addChild(screenshot);
			addChild(mask_view);
			addChild(scr_bg1);
			addChild(c_btn);
			addChild(smallcam_btn);
			addChild(pinkCap);
			addChild(yellowCap);
			addChild(greenCap);
			addChild(next_btn);
			
			scr_bg1.visible = true;
			pinkCap.visible = true;
			yellowCap.visible = true;
			greenCap.visible = true;
			blackCap.visible = true;
			orangeCap.visible = true;
			myvideo.visible = true;
			theTextField.visible = true;
			mask_view.visible = true;
			smallcam_btn.visible = true;
			
			next_btn.visible = true;
			next_btn.addEventListener(MouseEvent.CLICK, saveit);
			
			picturetaken.visible==false;
			
			if (picturetaken.visible==false)
			{
				c_btn.buttonMode = false;
				c_btn.visible = false;
				smallcam_btn.visible = true;
				
				//screenshot.visible = true;
				//screenshot.addChild(mypreview);
				//screenshot.x = 50;
				//screenshot.y = 45;
				//screenshot.height = ph;
				//screenshot.width = pw;

			}
			

		
		}

// back from Email after sending
		private function bkfromEmail(e:MouseEvent):void
		{
			
			//screenshot.visible = false;
			scr_bg2.visible = true;
			screenshot.visible = true;
			mask_view.visible = true;
			scr_bg1.visible = true;

			smallcam_btn.visible = false;
			pinkCap.visible = true;
			yellowCap.visible = true;
			greenCap.visible = true;
			blackCap.visible = true;
			orangeCap.visible = true;
			myvideo.visible = true;
			theTextField.visible = true;
			next_btn.visible = true;


			c_btn.visible = true;

			removeChild(rsend_btn);
			removeChild(new_btn);
			removeChild(tk);
			removeChild(msgSent);
			tk.visible = false;
			rsend_btn.visible = false;
			new_btn.visible = false;
			email_view2.visible = false;
			//removeChild(email_view2);
			
			screenshot.addChild(mypreview);
			screenshot.x = 15;
			screenshot.y = 15;
			screenshot.height = ph;
			screenshot.width = pw;
			screenshot.scaleX = 0.8;
			screenshot.scaleY = 0.8;
			messageTextField.x = 30;
			

	
			heremessage = theTextField.text;
			createOutputBox(heremessage);
			email_view.addChild(messageTextField);
			addChild(messageTextField);


			email_view.addChild(screenshot);
			email_view.addChild(email_th);
			email_view.addChild(messageTextField);
			email_view.x = 30;
			email_view.y = 40;
			

		}

		private function modify(e:MouseEvent):void
		{

			
			
			if (picturetaken.visible==true)
			{
				removeChild(scr_bg2);

			}
			

			//
			if (picturetaken.visible==false)
			{
				c_btn.buttonMode = false;
				c_btn.visible = false;
				smallcam_btn.visible = true;

			}
			
			
		screenshot.visible = true;
		screenshot.addChild(mypreview);
		screenshot.x = 50;
		screenshot.y = 45;
		screenshot.height = ph;
		screenshot.width = pw;
		c_btn.buttonMode = true;
		c_btn.visible = true;
		smallcam_btn.visible = false;
	
	
		
			addChild(screenshot);
			addChild(mask_view);
			addChild(scr_bg1);
			addChild(c_btn);
			addChild(smallcam_btn);
			addChild(pinkCap);
			addChild(yellowCap);
			addChild(greenCap);
			addChild(next_btn);
			next_btn.visible = true;

		}

		public function saveit(e:MouseEvent):void
		{
			

			
			heremessage = theTextField.text;
			createOutputBox(heremessage);
			//adding captured snapshot
			screenshot.x = 15;
			screenshot.y = 55;
			screenshot.scaleX = 0.8;
			screenshot.scaleY = 0.8;

			//adding email template
			email_th.load(new URLRequest("assets/email_frame.png"));
			email_view.addChild(screenshot);
			email_view.addChild(email_th);
			email_view.addChild(messageTextField);
			email_view.x = 30;
			email_view.y = 40;
			//email_view.alpha = 0.5;
			
			addChild(scr_bg2);
			scr_bg2.addChild(email_view);
			scr_bg2.addChild(md_btn);
			scr_bg2.addChild(sendBtn);
			
			scr_bg2.visible = true;
			email_view.visible = true;
			sendBtn.visible = true;
			//Text details on 2nd page in page movie scr_bg2
			//your name
			var myFont = new chalk();
			var myFormat3:TextFormat = new TextFormat();
			myFormat3.size = 30;
			myFormat3.font = myFont.fontName;
			myFormat3.leftMargin = 3;

			
			friendName= new TextField();
			friendName.defaultTextFormat = myFormat3;
			friendName.type = TextFieldType.INPUT;
			//friendName.text = "HI";
			friendName.border = true;
			friendName.width = 200;
			friendName.height = 32;
			friendName.x = 437;
			friendName.y = 269;
			friendName.background = true;
			scr_bg2.addChild(friendName);
			

			friendEmail= new TextField();
			friendEmail.defaultTextFormat = myFormat3;
			friendEmail.type = TextFieldType.INPUT;
			//friendEmail.text = "HI";
			friendEmail.border = true;
			friendEmail.width = 200;
			friendEmail.height = 32;
			friendEmail.x = 667;
			friendEmail.y = 269;
			friendEmail.background = true;
			scr_bg2.addChild(friendEmail);

			yourName= new TextField();
			yourName.defaultTextFormat = myFormat3;
			yourName.type = TextFieldType.INPUT;
			//yourName.text = "HI";
			yourName.border = true;
			yourName.width = 200;
			yourName.height = 32;
			yourName.x = 437;
			yourName.y = 339;
			yourName.background = true;
			scr_bg2.addChild(yourName);



			yourEmail= new TextField();
			yourEmail.defaultTextFormat = myFormat3;
			yourEmail.type = TextFieldType.INPUT;
			//yourEmail.text = "HI";
			yourEmail.border = true;
			yourEmail.width = 200;
			yourEmail.height = 32;
			yourEmail.x = 667;
			yourEmail.y = 339;
			yourEmail.background = true;
			scr_bg2.addChild(yourEmail);
			
			
			friendName.tabIndex = 1;
			
			friendEmail.tabIndex = 2;
			yourName.tabIndex = 3;
			yourEmail.tabIndex = 4;
			sendBtn.tabIndex = 5;
			md_btn.tabIndex = 6;
			
			friendName.focusRect  = true;
			friendEmail.focusRect  = true;
			yourEmail.focusRect  = true;
			yourName.focusRect  = true;
			
			sendBtn.tabEnabled = false;
			
			addChild(tw_btn);
			addChild(fb_btn);
			
		
	};



	private function pictureClick(e:MouseEvent):void
	{
		picturetaken.visible=true;
		//snap is bitmapDATA
		//take picture from video
		snapshot.draw(myvideo, drawMatrix2, null, "normal", null, true );
		byteArray = new JPGEncoder(90).encode(snapshot);
		mypreview = new Bitmap(snapshot);
		mypreview.bitmapData.draw(snapshot);


		//take Mask from video;
		imgshot.draw(Mask);
		byteArray2 = PNGEncoder.encode(imgshot);
		clip = new Bitmap(imgshot);
		clip.bitmapData.draw( imgshot );
		detector.detect(clip.bitmapData );

		screenshot.addChild(mypreview);
		screenshot.x = 50;
		screenshot.y = 65;
		screenshot.height = ph;
		screenshot.width = pw;
		screenshot.visible = true;
		

		c_btn.buttonMode = true;
		c_btn.visible = true;
		smallcam_btn.visible = false;

	}

	private function cameraReadyHandler( event:Event ):void
	{
		detectionMap.draw( camera.bitmapData, drawMatrix, null, "normal", null, true );
		detector.detect( detectionMap );

		var rect:Rectangle = camera.bitmapData.getColorBoundsRect(0xffffff,0x000000,true);
		if (rect.width == 488)
		{
			error.visible = true;
		}
		else
		{
			error.visible = false;
		}
	}

	private function initDetector():void
	{
		detector = new ObjectDetector();
		detector2 = new ObjectDetector();

		var options:ObjectDetectorOptions = new ObjectDetectorOptions();
		detector.options = options;
		detector2.options = options;
		detector.addEventListener( ObjectDetectorEvent.DETECTION_COMPLETE, detectionHandler );

	}



	private function detectionHandler( e:ObjectDetectorEvent ):void
	{
		var g:Graphics = faceRectContainer.graphics;
		g.clear();
		if (e.rects)
		{
			g.lineStyle( 2 );// black 2pix
			e.rects.forEach( function( r:Rectangle, idx:int, arr:Array ):void
			                    {
			                        g.drawRect( r.x * scaleFactor, r.y * scaleFactor, r.width * scaleFactor, r.height * scaleFactor );
			
			var MaskSX:Number = (r.width  * scaleFactor ) + imgW
			var MaskSY:Number = (r.height  * scaleFactor)
			var MaskX:Number = 0
			var MaskY:Number = 0
			var HeadCenterX:Number = ((r.width / 2 )* scaleFactor) + (r.x * scaleFactor) 
			var HeadCenterY:Number = ((r.height / 3 )* scaleFactor) + (r.y * scaleFactor) 
			MaskX = HeadCenterX - (MaskSX / 2) 
			MaskY = HeadCenterY - (MaskSY /2) - img
			//trace("x"+MaskX + "y,"+MaskY);
			//trace("width"+MaskSX + "height,"+MaskSY);
			
			ClipX = MaskX;
			ClipY = MaskY;
			ClipW = MaskSX;
			    ClipH = MaskSY;
			TweenLite.to(Mask, 0.5, { x:MaskX, y:MaskY, width:MaskSX, height:MaskSY} )
			
			                    });
		}

	}



	public function createOutputBox(str:String):void
	{

		var myFont = new chalk();
		var myFormat2:TextFormat = new TextFormat();
		myFormat2.size = 30;
		myFormat2.font = myFont.fontName;

		messageTextField= new TextField();

		messageTextField.type = TextFieldType.DYNAMIC;
		messageTextField.multiline = true;
		messageTextField.wordWrap = true;

		messageTextField.defaultTextFormat = myFormat2;
		messageTextField.text = heremessage;

		messageTextField.width = 310;
		messageTextField.height = 100;
		messageTextField.x = 20;
		messageTextField.y = 320;
		messageTextField.textColor = 0xFFFFFF;
		messageTextField.embedFonts = true;
		messageTextField.antiAliasType = AntiAliasType.ADVANCED;
		//messageTextField.background = true;


	}


}
}