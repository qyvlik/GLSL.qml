/*
  简单的顶点shader 
  至少要设置
*/

void main(void )
{
    //![0]
    gl_Position = gl_ProjectionMatrix * gl_ModelViewMatrix * gl_Vertex;
    //![0]
    
    //![1]
    gl_Position = gl_ModelViewProjectMatrix * gl_Vertex;
    //![1]
    
    //![2]
    gl_Position = ftransfrom(); // 效率最好
    //![2]

    // gl_FrontColor 必须设置值，可以默认设置为gl_Color
    // 也可以设置自定义颜色 i.e.
    // gl_FrontColor = vec4(0.4,0.4,0.4,1.0); // blue
    gl_FrontColor = gl_Color;
   
}