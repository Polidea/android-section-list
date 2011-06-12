package pl.polidea;

import java.util.Map;
import java.util.HashMap;

import java.io.FileOutputStream;
import android.graphics.Bitmap;
import java.lang.reflect.Modifier;
import java.lang.reflect.Field;
import android.app.Activity;
import android.app.PendingIntent;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

import android.util.Log;

aspect Screenshot {

    pointcut addScreenshot(final android.app.Activity activity): target(activity) && within(pl.finder.activities..*) && execution(void onCreate(..));

    before(final android.app.Activity activity) : addScreenshot(activity) {

//        if (!Modifier.isFinal(thisJoinPointStaticPart.getSignature().getDeclaringType().getModifiers())) {
//            return;
//        }

        if (Modifier.isAbstract(thisJoinPointStaticPart.getSignature().getDeclaringType().getModifiers())) {
            return;
        }

        Log.v("Screenshot", "registered " + thisJoinPointStaticPart.getSignature());

       final BroadcastReceiver screenshotIntentReceiver = new BroadcastReceiver() {

            @Override
            public void onReceive(final Context context, final Intent intent) {


                Field mResumed;
                try {
                    mResumed = Activity.class.getDeclaredField("mResumed");
                    mResumed.setAccessible(true);
                    final Boolean value = (Boolean) mResumed.get(activity);

                    if(!value.booleanValue()) {
                        return;
                    }

                } catch (final SecurityException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (final NoSuchFieldException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (final IllegalArgumentException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (final IllegalAccessException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }



                activity.getWindow().getDecorView().buildDrawingCache();
                final Bitmap bmp = activity.getWindow().getDecorView().getDrawingCache();

                try {
                    final FileOutputStream out = new FileOutputStream("/sdcard/apphance_screenshot.png");
                    bmp.compress(Bitmap.CompressFormat.PNG, 100, out);
                } catch (final Exception e) {
                    e.printStackTrace();
                }
                activity.getWindow().getDecorView().destroyDrawingCache();
                Log.v("Screenshot", "bitmap saved in /sdcard/apphance_screenshot.png " + thisJoinPointStaticPart.getSignature() );

            }
        };


        final String PROBLEM_ACTION = "pl.polidea.apphance.PROBLEM_FROM_STATUSBAR";

        activity.registerReceiver(screenshotIntentReceiver, new IntentFilter(PROBLEM_ACTION));




    }

}


