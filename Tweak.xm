#import <WebKit/WebPolicyDecisionListener.h>
#import <WebKit/WebPolicyDelegate.h>

%hook MFMessageWebLayer

- (void)webView:(UIView *)webView decidePolicyForNavigationAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request frame:(id)frame decisionListener:(id<WebPolicyDecisionListener>)listener {
	if ([request.URL.scheme isEqualToString:@"x-apple-msg-load"] || actionInformation[WebActionElementKey]) {
		%orig;
	} else {
		[listener ignore];
		HBLogInfo(@"DeDirect: Prevented a redirect from occurring. URL: %@, action information: %@", request.URL, actionInformation);
	}
}

- (void)webView:(UIView *)webView decidePolicyForNewWindowAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request newFrameName:(NSString *)frameName decisionListener:(id<WebPolicyDecisionListener>)listener {
	[listener ignore];
	HBLogInfo(@"DeDirect: Prevented a new window from being opened. URL: %@, action information: %@", request.URL, actionInformation);
}

%end
