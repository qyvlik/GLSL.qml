颜色shader
GLSL可以读取一些OpenGL状态，在本节我们将学习如何访问在OpenGL中设置的glColor变量。
GLSL有一个属性变量记录当前颜色，也提供易变变量从顶点shader向片断shader传递颜色值。

attribute vec4 gl_Color;  
varying vec4 gl_FrontColor; // writable onthe vertex shader  
varying vec4 gl_BackColor; // writable onthe vertex shader  
varying vec4 gl_Color; // readable on thefragment shader  
变量使用思想如下：
1、OpenGL程序通过glColor传送颜色信息。
2、顶点shader通过属性gl_Color接收颜色值。
3、顶点shader计算正面和反面的颜色，然后分别保存在gl_FrontColor和gl_BackColor中。
4、片断shader接收易变变量gl_Color中存储的插值产生的颜色，由当前图元的方向决定颜色是gl_FrontColor还是gl_BackColor插值产生的。
5、片断shader根据易变变量gl_Color设置gl_FragColor。
前 面说过顶点shader和片断shader中传递的易变变量要有相同的名字，但这里是个例外，顶点shader中的gl_FrontColor和 gl_BackColor会根据图元的方向，自动转变为片断shader中的gl_Color。还要注意属性变量gl_Color和易变变量 gl_Color没有冲突，因为前者只存在于顶点shader，后者只存在于片断shader。
下面是顶点shader的例子，只计算了正面颜色：