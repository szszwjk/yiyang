import com.yiyang.pojo.TDoctor;
import com.yiyang.pojo.TLocalinfo;
import com.yiyang.service.doctor.DoctorService;
import com.yiyang.service.user.locationService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.util.Date;



public class MyTest {
        @Test
        public  void  demo1() throws IOException {
            ApplicationContext aContext=new ClassPathXmlApplicationContext("applicationContext.xml");
            DoctorService doctorService= (DoctorService) aContext.getBean("doctorServiceImpl");
            TDoctor doctor = new TDoctor();
            doctor.setdUser( "赵九" );
            doctor.setdHname( "医院" );
            doctor.setdCnum( "003" );
            doctor.setdInfo1( "内科" );
            doctor.setdAddress( "山西太原" );
            doctorService.insertDoctor( doctor );

        }
        @Test
        public  void demo2(){
            ApplicationContext ac = new ClassPathXmlApplicationContext( "applicationContext.xml" );
            locationService locationService = (locationService) ac.getBean( "DoctorServiceImpl" );
            TLocalinfo tLocalinfo = new TLocalinfo();
            tLocalinfo.setlDate( new Date(  ) );
            tLocalinfo.setlLocalx( "111,120.135'23" );
            tLocalinfo.setlLocaly( "158.265.495" );
            tLocalinfo.setlUser( "张三" );
            locationService.insertLocation( tLocalinfo );
        }
    @Test
    public void demo3() {
        ApplicationContext ac = new ClassPathXmlApplicationContext( "applicationContext.xml" );
        DoctorService doctorService = (DoctorService) ac.getBean( "doctorServiceImpl" );
        TDoctor doctor = doctorService.findDoctorByName( "zhang" );
        System.out.println(doctor);

    }
    }


