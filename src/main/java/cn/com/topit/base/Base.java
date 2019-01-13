package cn.com.topit.base;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

class Base<T> {
	//通过父类的getGenericType(0)取得泛型Class，以实现new T()的功能
	public Class getGenericType(int index) {
		Type genType = getClass().getGenericSuperclass();
		if (!(genType instanceof ParameterizedType)) {
			return Object.class;
		}
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		if (index >= params.length || index < 0) {
			throw new RuntimeException("Index outof bounds");
		}
		if (!(params[index] instanceof Class)) {
			return Object.class;
		}
		return (Class) params[index];
	}
}