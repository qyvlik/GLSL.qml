/*
  简单的片段着色器
  设置gl_FragColor 类似于在顶点着色器中同时为gl_FrontColor && gl_BackColor设置相同的颜色；
  这里默认设置为gl_Color.
*/

void main(void )
{
    gl_FragColor = gl_Color;
}