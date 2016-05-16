// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from djinni_sqlite.djinni

#include "NativeTodo.hpp"  // my header
#include "Marshal.hpp"

namespace djinni_generated {

NativeTodo::NativeTodo() = default;

NativeTodo::~NativeTodo() = default;

auto NativeTodo::fromCpp(JNIEnv* jniEnv, const CppType& c) -> ::djinni::LocalRef<JniType> {
    const auto& data = ::djinni::JniClass<NativeTodo>::get();
    auto r = ::djinni::LocalRef<JniType>{jniEnv->NewObject(data.clazz.get(), data.jconstructor,
                                                           ::djinni::get(::djinni::I32::fromCpp(jniEnv, c.id)),
                                                           ::djinni::get(::djinni::String::fromCpp(jniEnv, c.label)),
                                                           ::djinni::get(::djinni::I32::fromCpp(jniEnv, c.completed)))};
    ::djinni::jniExceptionCheck(jniEnv);
    return r;
}

auto NativeTodo::toCpp(JNIEnv* jniEnv, JniType j) -> CppType {
    ::djinni::JniLocalScope jscope(jniEnv, 4);
    assert(j != nullptr);
    const auto& data = ::djinni::JniClass<NativeTodo>::get();
    return {::djinni::I32::toCpp(jniEnv, jniEnv->GetIntField(j, data.field_mId)),
            ::djinni::String::toCpp(jniEnv, (jstring)jniEnv->GetObjectField(j, data.field_mLabel)),
            ::djinni::I32::toCpp(jniEnv, jniEnv->GetIntField(j, data.field_mCompleted))};
}

}  // namespace djinni_generated