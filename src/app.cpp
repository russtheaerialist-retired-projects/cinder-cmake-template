#include "cinder/app/AppNative.h"

#include <memory>

using namespace ci;
using namespace ci::app;
using namespace std;

// We'll create a new Cinder Application by deriving from the App class
class BasicApp : public AppNative
{
public:
    void setup() override;
    void draw() override;

private:
};

void BasicApp::setup()
{
}

void BasicApp::draw()
{
    gl::clear( Color(0, 0.0, 0.3) );
}

// This line tells Cinder to actually create the application
CINDER_APP_NATIVE( BasicApp, RendererGl )
