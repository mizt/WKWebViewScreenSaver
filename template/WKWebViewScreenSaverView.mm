#import <ScreenSaver/ScreenSaver.h>
#import <Webkit/Webkit.h>

namespace FileManager {
    NSURL *indexHTML(NSString *identifier) {
        return  [NSURL URLWithString:[@"file://" stringByAppendingString:[[NSBundle bundleWithIdentifier:identifier] pathForResource:@"index" ofType:@"html"]]];
    }
};

@interface SCREENSAVER_NAMEView : ScreenSaverView
@end

@implementation RGBView {
    WKWebView *_webView;
}

-(instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if(self) {
        [self setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
        [self setAutoresizesSubviews:YES];
    }
    return self;
}

-(void)startAnimation {
    [super startAnimation];
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKPreferences *preferences = [[WKPreferences alloc] init];
    configuration.preferences = preferences;
    [configuration.preferences setValue:@NO forKey:@"javaScriptCanOpenWindowsAutomatically"];
    [configuration.preferences setValue:@YES forKey:@"allowFileAccessFromFileURLs"];
    _webView = [[WKWebView alloc] initWithFrame:[self bounds] configuration:configuration];
    [_webView setValue:[NSNumber numberWithBool: YES] forKey:@"drawsTransparentBackground"];
    NSURL *indexHTML = FileManager::indexHTML(@"WKWebViewScreenSaver.SCREENSAVER_NAME");
    [_webView loadFileURL:indexHTML allowingReadAccessToURL:[indexHTML URLByDeletingLastPathComponent]];
    [self addSubview:_webView];
}

-(void)stopAnimation {
    [super stopAnimation];
    [_webView removeFromSuperview];
    _webView = nil;
}

-(void)animateOneFrame {
    return;
}

-(BOOL)hasConfigureSheet {
    return NO;
}

-(NSWindow*)configureSheet {
    return nil;
}

@end
