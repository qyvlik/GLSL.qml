
/*
  得到一个扁平的3D模型
*/
void main(void)  
{  
    vec4 v = vec4(gl_Vertex);  
    v.z = 0.0;  // 只需要在应用模型视图变换时将模型顶点的z坐标设为0就行了
  
    gl_Position =gl_ModelViewProjectionMatrix * v;  
}  