// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from djinni_sqlite.djinni

#import "DSMyClientInterface+Private.h"
#import "DSMyClientInterface.h"
#import "DJIMarshal+Private.h"
#import "DJIObjcWrapperCache+Private.h"

static_assert(__has_feature(objc_arc), "Djinni requires ARC to be enabled for this file");

namespace djinni_generated {

class MyClientInterface::ObjcProxy final
: public ::djinni_sqlite::MyClientInterface
, public ::djinni::ObjcProxyCache::Handle<ObjcType>
{
public:
    using Handle::Handle;
    bool log_string(const std::string & c_str) override
    {
        @autoreleasepool {
            auto r = [Handle::get() logString:(::djinni::String::fromCpp(c_str))];
            return ::djinni::Bool::toCpp(r);
        }
    }
};

}  // namespace djinni_generated

namespace djinni_generated {

auto MyClientInterface::toCpp(ObjcType objc) -> CppType
{
    if (!objc) {
        return nullptr;
    }
    return ::djinni::get_objc_proxy<ObjcProxy>(objc);
}

auto MyClientInterface::fromCppOpt(const CppOptType& cpp) -> ObjcType
{
    if (!cpp) {
        return nil;
    }
    return dynamic_cast<ObjcProxy&>(*cpp).Handle::get();
}

}  // namespace djinni_generated
