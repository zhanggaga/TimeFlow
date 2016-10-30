using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text;
public partial class ValidateCode : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string validateCode = CreateValidateCode();//生成验证码 
        Bitmap bitmap = new Bitmap(imgWidth, imgHeight);//生成Bitmap图像 
        DisturbBitmap(bitmap); //图像背景 
        DrewValidateCode(bitmap, validateCode);//绘制验证码图像 
        bitmap.Save(Response.OutputStream, ImageFormat.Gif);//保存图像，等待输出 

    }

    private int codeLen = 4;//验证码长度 
    private int fineness = 85;//图片清晰度 
    private int imgWidth = 60;//图片宽度 
    private int imgHeight = 30;//图片高度 
    private string fontFamily = "Times New Roman";//字体名称 
    private int fontSize = 18;//字体大小 
    //private int fontStyle = 0;//字体样式 
    private int posX = 0;//绘制起始坐标X 
    private int posY = 0;//绘制坐标Y 

    private string CreateValidateCode() //生成验证码 
    {
        string validateCode = "";
        Random random = new Random();// 随机数对象 
        StringBuilder sCode = new StringBuilder();
        for (int i = 0; i < codeLen; i++)//循环生成每位数值 
        {
            //int n = random.Next(14);//数字 
            // validateCode += n.ToString();
            sCode.Append(random.Next(0, 10));
        }
        validateCode = sCode.ToString();
        Session["Vcode"] = validateCode;//保存验证码 
        return validateCode;// 返回验证码 
    }

    private void DisturbBitmap(Bitmap bitmap)//图像背景 
    {
        Random random = new Random();//通过随机数生成 
        for (int i = 0; i < bitmap.Width; i++)//通过循环嵌套，逐个像素点生成 
        {
            for (int j = 0; j < bitmap.Height; j++)
            {
                if (random.Next(90) <= this.fineness)
                    bitmap.SetPixel(i, j, Color.LightGray);
            }
        }
    }
    private void DrewValidateCode(Bitmap bitmap, string validateCode)//绘制验证码图像 
    {
        Graphics g = Graphics.FromImage(bitmap);//获取绘制器对象 
        Font font = new Font(fontFamily, fontSize, FontStyle.Bold);//设置绘制字体 
        g.DrawString(validateCode, font, Brushes.Black, posX, posY);//绘制验证码图像 
    }

}
