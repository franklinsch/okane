pod 'Braintree'

 #import "BraintreeCore.h"
 #import "BraintreeUI.h"

 func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    BTAppSwitch.setReturnURLScheme("<#com.your-company.Your-App.payments#>")
    return true
}

func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
    if url.scheme.localizedCaseInsensitiveCompare("<#com.your-company.Your-App.payments#>") == .OrderedSame {    
        return BTAppSwitch.handleOpenURL(url, sourceApplication:sourceApplication)
    }
    return false
}

var braintreeClient: BTAPIClient?

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let clientTokenURL = NSURL(string: "https://braintree-sample-merchant.herokuapp.com/client_token")!
        let clientTokenRequest = NSMutableURLRequest(URL: clientTokenURL)!
        clientTokenRequest.setValue("text/plain", forHTTPHeaderField: "Accept")

        NSURLSession.sharedSession().dataTaskWithRequest(clientTokenRequest) { (data, response, error) -> Void in
            // TODO: Handle errors
            let clientToken = String(data: data!, encoding: NSUTF8StringEncoding)

            self.braintreeClient = BTAPIClient(authorization: clientToken!)

            // As an example, you may wish to present our Drop-in UI at this point.
            // Continue to the next section to learn more...
        }.resume()
    }
}

let clientToken = "eyJ2ZXJzaW9uIjoyLCJhdXRob3JpemF0aW9uRmluZ2VycHJpbnQiOiJjYjgwMjQ1OGU3OTE4NDI4ZTQxMzk3Yjc2NjU0Njg3NmQ4M2QyNTIxZTAyZDY4YzJmODFmNjUwN2NlNjcxY2RkfGNyZWF0ZWRfYXQ9MjAxNS0xMi0xM1QwMzo0ODowNC41MDM3MTUwNjQrMDAwMFx1MDAyNm1lcmNoYW50X2lkPTM0OHBrOWNnZjNiZ3l3MmJcdTAwMjZwdWJsaWNfa2V5PTJuMjQ3ZHY4OWJxOXZtcHIiLCJjb25maWdVcmwiOiJodHRwczovL2FwaS5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tOjQ0My9tZXJjaGFudHMvMzQ4cGs5Y2dmM2JneXcyYi9jbGllbnRfYXBpL3YxL2NvbmZpZ3VyYXRpb24iLCJjaGFsbGVuZ2VzIjpbXSwiZW52aXJvbm1lbnQiOiJzYW5kYm94IiwiY2xpZW50QXBpVXJsIjoiaHR0cHM6Ly9hcGkuc2FuZGJveC5icmFpbnRyZWVnYXRld2F5LmNvbTo0NDMvbWVyY2hhbnRzLzM0OHBrOWNnZjNiZ3l3MmIvY2xpZW50X2FwaSIsImFzc2V0c1VybCI6Imh0dHBzOi8vYXNzZXRzLmJyYWludHJlZWdhdGV3YXkuY29tIiwiYXV0aFVybCI6Imh0dHBzOi8vYXV0aC52ZW5tby5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tIiwiYW5hbHl0aWNzIjp7InVybCI6Imh0dHBzOi8vY2xpZW50LWFuYWx5dGljcy5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tIn0sInRocmVlRFNlY3VyZUVuYWJsZWQiOnRydWUsInRocmVlRFNlY3VyZSI6eyJsb29rdXBVcmwiOiJodHRwczovL2FwaS5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tOjQ0My9tZXJjaGFudHMvMzQ4cGs5Y2dmM2JneXcyYi90aHJlZV9kX3NlY3VyZS9sb29rdXAifSwicGF5cGFsRW5hYmxlZCI6dHJ1ZSwicGF5cGFsIjp7ImRpc3BsYXlOYW1lIjoiQWNtZSBXaWRnZXRzLCBMdGQuIChTYW5kYm94KSIsImNsaWVudElkIjpudWxsLCJwcml2YWN5VXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3BwIiwidXNlckFncmVlbWVudFVybCI6Imh0dHA6Ly9leGFtcGxlLmNvbS90b3MiLCJiYXNlVXJsIjoiaHR0cHM6Ly9hc3NldHMuYnJhaW50cmVlZ2F0ZXdheS5jb20iLCJhc3NldHNVcmwiOiJodHRwczovL2NoZWNrb3V0LnBheXBhbC5jb20iLCJkaXJlY3RCYXNlVXJsIjpudWxsLCJhbGxvd0h0dHAiOnRydWUsImVudmlyb25tZW50Tm9OZXR3b3JrIjp0cnVlLCJlbnZpcm9ubWVudCI6Im9mZmxpbmUiLCJ1bnZldHRlZE1lcmNoYW50IjpmYWxzZSwiYnJhaW50cmVlQ2xpZW50SWQiOiJtYXN0ZXJjbGllbnQzIiwiYmlsbGluZ0FncmVlbWVudHNFbmFibGVkIjp0cnVlLCJtZXJjaGFudEFjY291bnRJZCI6ImFjbWV3aWRnZXRzbHRkc2FuZGJveCIsImN1cnJlbmN5SXNvQ29kZSI6IlVTRCJ9LCJjb2luYmFzZUVuYWJsZWQiOmZhbHNlLCJtZXJjaGFudElkIjoiMzQ4cGs5Y2dmM2JneXcyYiIsInZlbm1vIjoib2ZmIn0="


class MyViewController: UIViewController, BTDropInViewControllerDelegate {

    var braintreeClient: BTAPIClient?

    func dropInViewController(viewController: BTDropInViewController!, didSucceedWithPaymentMethod paymentMethod: BTPaymentMethod!) {
        // ...
    }

    func dropInViewControllerDidCancel(viewController: BTDropInViewController!) {
        // ...
    }
}

// MyViewController.swift
class MyViewController: UIViewController, BTDropInViewControllerDelegate {

    // If you use a client token, you should ensure that users cannot tap the pay button
    // until the client token has been obtained from your server and used to create a BTAPIClient.

    var braintreeClient: BTAPIClient?

    func tappedMyPayButton() {

        // If you haven't already, create and retain a `BTAPIClient` instance with a
        // tokenization key OR a client token from your server.
        // Typically, you only need to do this once per session.
        // braintreeClient = BTAPIClient(authorization: aClientToken)

        // Create a BTDropInViewController
        let dropInViewController = BTDropInViewController(APIClient: braintreeClient)
        dropInViewController.delegate = self

        // This is where you might want to customize your view controller (see below)

        // The way you present your BTDropInViewController instance is up to you.
        // In this example, we wrap it in a new, modally-presented navigation controller:
        dropInViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Cancel,
            target: self, action: "userDidCancelPayment")
        let navigationController = UINavigationController(rootViewController: dropInViewController)
        presentViewController(navigationController, animated: true, completion: nil)
    }

    func userDidCancelPayment() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // Implement BTDropInViewControllerDelegate ...
}

func dropInViewController(viewController: BTDropInViewController!,
    didSucceedWithTokenization paymentMethodNonce: BTPaymentMethodNonce!)
{
    // Send payment method nonce to your server for processing
    postNonceToServer(tokenization.paymentMethodNonce)
    dismissViewControllerAnimated(true, completion: nil)
}

func dropInViewControllerDidCancel(viewController: BTDropInViewController!) {
    dismissViewControllerAnimated(true, completion: nil)
}

func postNonceToServer(paymentMethodNonce: String) {
    let paymentURL = NSURL(string: "https://your-server.example.com/payment-methods")!
    let request = NSMutableURLRequest(URL: paymentURL)!
    request.HTTPBody = "payment_method_nonce=\(paymentMethodNonce)".dataUsingEncoding(NSUTF8StringEncoding)
    request.HTTPMethod = "POST"

    NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
        // TODO: Handle success or failure
    }.resume()
}