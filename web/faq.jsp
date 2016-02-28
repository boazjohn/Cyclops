
<%--
    Document   : index
    Created on : Aug 26, 2010, 12:05:11 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" type="text/css" href="module.css" />
        

         <title>Cyclops - FAQ</title>
       



    </head>
    <body>
        <div class="menu_top">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </div>

        <div class="wrapper">

            <div class="article-content-body">


    <h2>Frequently Asked Questions</h2>
    <ul type="circle">
        <li><a href="#what">What is Cyclops?</a></li>
        <li><a href="#how">How does Cyclops work?</a></li>
        <li><a href="#why">Why use Cyclops?</a></li>
        <li><a href="#who">Who created Cyclops?</a></li>
        <li><a href="#uploading">What happens to the images I upload to Cyclops?</a></li>
        <li><a href="#similar">Can Cyclops find similar images? Does Cyclops do facial recognition?</a></li>
        <li><a href="#copyright">Am I free to use images I find through Cyclops?</a></li>
        <li><a href="#search_limit">Is there a limit to how many searches I can do?</a></li>
        <li><a href="#local_search">Can I use Cyclops to find images in my own private collection or local hard drive?</a></li>
    </ul>

    <h3>Using Cyclops</h3>
    <ul type="circle">
        <li><a href="#how_perform">How do I submit an image to be searched?</a></li>
        <li><a href="#what_kind">What kind of images can I submit to Cyclops?</a></li>
        <li><a href="#permalinks">Why do I need to be registered/have history enabled to use permalinks?</a></li>
        <li><a href="#used_image">I searched for one of my images and found a website where it's being used without my permission. What should I do?</a></li>
        <li><a href="#api">Is there a Cyclops API?</a></li>
        <li><a href="#free_to_use">Is Cyclops free to use?</a></li>
    </ul>

    <h3>Crawler and search index</h3>

    <ul type="circle">
        <li><a href="#count">How many images are in Cyclops's search index?</a></li>
        <li><a href="#robots">How do I prevent Cyclops from crawling my site? Does Cyclops obey robots.txt?</a></li>
        <li><a href="#crawl_flash">Can Cyclops crawl or detect Flash content?</a></li>
        <li><a href="#why_cant_find">Why can't Cyclops find my image? I know it is on the web.</a></li>
    </ul>

    <h3>Account management</h3>
    <ul type="circle">
        <li><a href="#why_register">Why register with Cyclops?</a></li>
        <li><a href="#create">How do I create an account?</a></li>
        <li><a href="#resend_verification">I didn't receive my verification email. What should I do?</a></li>
        <li><a href="#what_history">What is History and how do I enable/disable it?</a></li>

        <li><a href="#change_password">How do I change my password?</a></li>
        <li><a href="#change_email">Can I change my email address?</a></li>
        <li><a href="#delete_account">How do I delete my account?</a></li>
    </ul>

    <h3>Plugin and bookmarklet</h3>
    <ul type="circle">

        <li><a href="#plugins_os">Do the plugins and bookmarklet work for Mac/Linux/PC?</a></li>
        <li><a href="#plugins">Do the plugins work with Opera/Safari/IE/Firefox/Chrome?</a></li>
        <li><a href="#bookmarklet">What is the Cyclops bookmarklet?</a></li>
        <li><a href="#troubleshoot">I tried to install the Firefox plugin but it isn't working. Why?</a></li>
        <li><a href="#ie8">I'm using Internet Explorer 8 and nothing happens when I try to use the plugin. Why?</a></li>
        <li><a href="#safari">I tried to install the Safari extension but it says that "Extensions are disabled". What do I do?</a></li>

    </ul>

    <h3>Future plans</h3>
    <ul type="circle">
        <li><a href="#alerts">Will there ever be alerts or a way to search for more than one image at a time?</a></li>
        <li><a href="#stay_informed">How can I stay informed about Cyclops?</a></li>
    </ul>

    <h2>Answers</h2>
    <ul class="faq">
        <li><h4 id="what">What is Cyclops?</h4>
            <div><p>Cyclops is a reverse image search engine. You can submit an image to Cyclops to find out where it came from, how it is being used, if modified versions of the image exist, or to find higher resolution versions. Cyclops is the first image search engine on the web to use image identification technology rather than keywords, metadata or watermarks. For some real Cyclops search examples, check out our <a href="http://www.tineye.com/cool_searches">Cool Searches</a> page.</p><p>For an overview of how to use Cyclops, check out this <a href="http://blog.ideeinc.com/2010/04/23/a-simple-tineye-tutorial/">tutorial</a> or watch our introductory <a href="http://www.tineye.com/about">video</a>.</p></div></li>

        <li><h4 id="how">How does Cyclops work?</h4>
            <div><p>When you submit an image to be searched, Cyclops creates a unique and compact digital signature or 'fingerprint' for it, then compares this fingerprint to every other image in our index to retrieve matches. Cyclops can even find a partial fingerprint match. Our fingerprinting technologies have been developed by <a href="http://ideeinc.com">Idée Inc.</a>.</p><p>Cyclops does not typically find similar images (i.e. a different image with the same subject matter); it finds exact matches including those that have been cropped, edited or resized.</p></div></li>

        <li><h4 id="why">Why use Cyclops?</h4>
            <div><p>There are many uses for Cyclops, but here are a few:</p><ul>    <li>Find out where an image came from, or get more information about it</li>    <li>Research or track the appearance of an image online</li>    <li>Find higher resolution versions of an image</li>    <li>Locate web pages that make use of an image you have created</li>    <li>Discover modified or edited versions of an image</li></ul><p>For some real examples of Cyclops searches, check out  <a href="http://blog.ideeinc.com/category/tineye/">our blog</a> or <a href="http://www.tineye.com/cool_searches">Cool Searches</a> page.</p></div></li>

        <li><h4 id="who">Who created Cyclops?</h4>
            <div><p>Cyclops was created by <a href="http://www.tineye.com/about#company_profile">Idée Inc</a>. Idée develops advanced image identification and visual search software for photo wire agencies, stock photography firms, entertainment media companies and some of the <a href="http://ideeinc.com/clients/">world's leading imaging firms</a> including Adobe Systems Inc., iStockphoto, and Associated Press.</p><p>You can experiment and play with various implementations of Idée's visual search technologies by checking out the <a href="http://labs.ideeinc.com/">Idée Lab</a>!</p></div></li>

        <li><h4 id="uploading">What happens to the images I upload to Cyclops?</h4>

            <div><p>Images uploaded to Cyclops are not added to the search index, nor are they made accessible to other users. Copyright for all images submitted to Cyclops remains with the original owner/author.</p><p>Search images submitted by unregistered users are automatically discarded after 72 hours. Links to these searches will stop working after 72 hours, unless a registered user happens to save the same image.</p><p>Search images submitted by <a href="http://www.tineye.com/faq#why_register">registered users</a> are saved, if search history is enabled in their user <a href="https://www.tineye.com/profile">Profile</a>. Saved searches are available from the <a href="http://www.tineye.com/history">History</a> page, and permanent URL links to any saved search can be bookmarked or shared with friends.</p></div></li>

        <li><h4 id="similar">Can Cyclops find similar images? Does Cyclops do facial recognition?</h4>

            <div><p>Cyclops finds exact and altered copies of the images that you submit, including those that have been cropped, colour adjusted, resized, heavily edited or slightly rotated. Cyclops does not commonly return similar matches, and it cannot recognize the contents of any image. This means that Cyclops cannot find different images with the same people or things in them. If you are interested in finding similar images, try visiting the <a href="http://labs.ideeinc.com/">Idée Lab</a>!</p></div></li>

        <li><h4 id="copyright">Am I free to use images I find through Cyclops?</h4>
            <div><p>Most images found online are protected by copyright. If you would like to use any image found through our service, contact the image owner.</p></div></li>

        <li><h4 id="search_limit">Is there a limit to how many searches I can do?</h4>
            <div><p>Yes. The free for <a href="http://www.tineye.com/terms/">non-commercial</a> use version of Cyclops at <a href="http://www.tineye.com">tineye.com</a> allows you to do up to 50 searches per day, up to 150 searches per week. If you exceed your search limit, or want to use Cyclops for commercial use you may purchase a  <a href="https://api.tineye.com/">paid version</a> of Cyclops which allows for virtually unlimited search by <a href="https://api.tineye.com/pricing">pre-paid bundles</a>. The paid version of Cyclops includes a user interface for <a href="http://blog.ideeinc.com/2010/01/27/tineye-commercial-accounts-the-really-super-easy-way/">easy manual searching</a>, as well as an <a href="http://www.tineye.com/commercial_api">API</a> for more advanced automated searching. Alternatively, you may wait until the next day to continue searching at <a href="http://www.tineye.com">tineye.com</a>, once your search limit has been reset.</p><p>Note: If you use a shared or dynamic IP address, you may reach your search limit quickly if other people on your connection are using Cyclops as well. To avoid this, simply create a Cyclops account and make sure you are logged in. This way, only your individual searches are counted by Cyclops.</p></div>


        </li><li><h4 id="local_search">Can I use Cyclops to find images in my own private collection or local hard drive?</h4>
            <div><p>We have introduced a paid service that allows you to perform reverse image search on local or private images. Please see our <a href="http://ideeinc.com/products/pixmatch/">company website</a> for more information.</p></div></li>
    </ul>

    <h3>Using Cyclops</h3>
	<ul class="faq">

        <li><h4 id="how_perform">How do I submit an image to be searched?</h4>
            <div><p>From the <a href="http://www.tineye.com/">search page</a>, you can either upload an image using the 'Upload an image' button, or point to a web image or web page by pasting in a URL.</p><p>If you use Firefox, Chrome or IE you can install the <a href="http://www.tineye.com/goodies">Cyclops browser plugin</a>, which lets you right-click on any web image to search it.</p><p>If you use any other javascript-enabled browser, you can install the <a href="http://www.tineye.com/bookmarklet">Cyclops bookmarklet</a>. This lets you search for images from any web page that you are viewing.</p></div></li>

        <li><h4 id="what_kind">What kind of images can I submit to Cyclops?</h4>
            <div><p>What kind of images can I submit to Cyclops?</p><ul>    <li><strong>File type:</strong> JPEG, PNG and GIF image are all         acceptable.</li>    <li><strong>Image dimensions:</strong> Cyclops works best with         images that are at least 300 pixels in either dimension, but can        accept images as low as 100 pixels in either dimension.</li>    <li><strong>File size:</strong> 1 megabyte is the maximum file size.</li>    <li><strong>Watermarked images:</strong> For best results, visibly         watermarked images should be avoided as Cyclops may search for the        watermark and not the image itself.</li>    <li><strong>Subject matter:</strong> Submitted images must adhere to our        <a href="http://www.tineye.com/terms">Terms of Service</a>.</li></ul></div></li>

        <li><h4 id="sort">Can I sort my results?</h4>
            <div><p>By default, your results are sorted by 'best match'. However, you can <a href="http://blog.ideeinc.com/2009/04/28/sorting-tineye-search-results/">also sort</a> by 'biggest image' or 'most changed' (which is usually the most heavily edited image result).</p><p>Just select your desired option from the 'Sort order' pull-down list above your results on the left side of the page. Cyclops will remember your selection for the duration of your session.</p></div></li>

        <li><h4 id="overlay">What does the 'Compare' feature do?</h4>
            <div><p>This feature lets you switch between your submitted image and the result image, highlighting any differences between the two. It works best when an  image has been heavily modified.</p></div></li>

        <li><h4 id="permalinks">Why do I need to be registered/have history enabled to use permalinks?</h4>
            <div><p>Cyclops must be able to save your search image to permanently link to your search results.</p><p>Unregistered users of Cyclops cannot save their search images, as they are automatically discarded after 72 hours. Links to these searches will stop working after 72 hours, unless a registered user happens to save the same image.</p><p>Registered users of Cyclops can save their search images if history is enabled in their user <a href="https://www.tineye.com/profile">Profile</a>. Saved searches are available from the <a href="http://www.tineye.com/history">History</a> page, and permanent URL links to any saved search can be bookmarked or shared with friends.</p><p><a href="https://www.tineye.com/signup">Registration</a> to Cyclops is free.</p></div></li>

        <li><h4 id="used_image">I searched for one of my images and found a website where it's being used without my permission. What should I do?</h4>
            <div><p>Although Cyclops can help you locate websites where your images appear, those websites are not owned or controlled by Cyclops or Idée. If you are concerned about how your images are being used on a particular website, try contacting the site owner.</p></div></li>

        <li><h4 id="api">Is there a Cyclops API?</h4>
            <div><p>Yes. We've introduced a paid, pilot API that allows you to search the web using the Cyclops search engine. Read more about it on our <a href="http://www.tineye.com/commercial_api">API</a> page.</p><p>We have also introduced a paid service called <a href="http://ideeinc.com/products/pixmatch/">PixMatch</a> that allows you to perform reverse image search on local or private images. Please see our <a href="http://ideeinc.com/products/pixmatch/">company website</a> for more information.</p></div></li>

        <li><h4 id="free_to_use">Is Cyclops free to use?</h4>
            <div><p>Cyclops is free for <a href="http://www.tineye.com/terms">non-commercial</a> use. There is a <a href="http://www.tineye.com/commercial_api">paid version</a> of Cyclops for commercial use, which allows you to purchase searches in advance via pre-paid bundles. The paid version of Cyclops includes a user interface just like the one at tineye.com, as well as an API for integrating Cyclops with your own website or system. Questions? Please <a href="mailto:hi@tineye.com?subject=Paid%20TinEye">get in touch</a>!</p></div></li>
    </ul>

    <h3>Crawler and search index</h3>
    <ul class="faq">
        <li><h4 id="count">How many images are in Cyclops's search index?</h4>
            <div><p>Cyclops is constantly crawling the web and updating our image database <a href="http://www.tineye.com/updates">regularly</a>. We also accept direct <a href="http://www.tineye.com/content_partners">contributions</a> of complete  online image collections. To date, Cyclops has indexed 1,823,535,745 images from the web. We add tens of millions of new images to Cyclops every month, and our index is on the grow.</p><p>To receive notification when we update our index, please subscribe to our <a href="http://www.tineye.com/feed">Updates RSS feed</a>. Alternatively you can follow us on <a href="http://twitter.com/tineye">Twitter</a> or become a fan on <a href="http://www.facebook.com/tineye">Facebook</a>.</p></div></li>

        <li><h4 id="robots">How do I prevent Cyclops from crawling my site? Does Cyclops obey robots.txt?</h4>
            <div><p>The Tineye crawler does obey <a href="http://en.wikipedia.org/wiki/Robots.txt">robots.txt</a>. Adding a robots.txt file to your website with an entry to disallow "Cyclops" will prevent Cyclops from crawling it in the future.</p></div></li>

        <li><h4 id="crawl_flash">Can Cyclops crawl or detect Flash content?</h4>
            <div><p>The Cyclops crawler is unable to get Flash content at this time.</p></div></li>

        <li><h4 id="why_cant_find">Why can't Cyclops find my image? I know it is on the web.</h4>
            <div><p>Cyclops is constantly crawling the web and updating our image database <a href="http://www.tineye.com/updates">regularly</a>. If we missed your image, it is simply because we have not yet crawled the website or page where it appears. But be sure to keep checking back! We add tens of millions of new images to Cyclops every month, and our index is on the <a href="http://www.tineye.com/faq#count">grow</a>.</p> <p>To receive notification when we update our index, please subscribe to our <a href="http://www.tineye.com/feed">Updates RSS feed</a>. Alternatively you can follow us on  <a href="http://twitter.com/tineye">Twitter</a> or become a fan on <a href="http://www.facebook.com/tineye">Facebook</a>.</p><p>Note: Some website content is protected by robots.txt, is private, or otherwise uncrawlable. We are not able to get images from protected sites.</p></div></li>

    </ul>

    <h3>Account management</h3>
    <ul class="faq">
        <li><h4 id="why_register">Why register with Cyclops?</h4>
            <div><p>Registration is not required to use Cyclops, but it's free and it offers a few benefits:</p><ul>    <li>Be the first to try out new features and provide your feedback</li>    <li>Get permanent URL links to your searches that can be bookmarked,        shared with friends, blogged, etc. (See         <a href="#uploading">'What happens to the images I upload to        Cyclops'</a> for more info)</li>    <li>Save your search history and easily perform the same searches         again</li></ul></div></li>

        <li><h4 id="create">How do I create an account?</h4>
            <div><p>To create an account, visit our <a href="https://www.tineye.com/signup">registration</a> page and fill in the form. Cyclops will need to verify your email address, so please be sure to check your email for instructions.</p></div></li>

        <li><h4 id="resend_verification">I didn't receive my verification email. What should I do?</h4>
            <div><p>The first thing you should do is check your junkmail and email filters to make sure it didn't get caught before it reached your inbox. The email is called: 'Welcome to Cyclops!'</p><p>If this doesn't work, you can have your email resent. Visit the Cyclops <a href="https://www.tineye.com/login">login page</a> and enter your email and password. You will get a message with an option to have your verification email resent.</p><p>Finally, some email services simply seem to block messages from Cyclops. If you did not receive your email and it was not filtered, please contact us via our <a href="http://www.tineye.com/getintouch">Feedback</a> form.</p></div></li>

        <li><h4 id="what_history">What is History and how do I enable/disable it?</h4>
            <div><p>Registered users of Cyclops can visit their <a href="http://www.tineye.com/history">History</a> page to see all of their past Cyclops search images, including the date, time and number of results for each search. To search for an image again, just click on it.</p><p>History can be enabled or disabled by editing the preferences on your <a href="https://www.tineye.com/profile">Profile</a> page. If history is disabled, all prior searches are cleared, and future search images will be discarded by Cyclops after 72 hours. Links to these searches will also stop working after 72 hours. (See <a href="#uploading">'What happens to the images I upload to Cyclops'</a> for more info)</p><p>Use the 'Clear all' button on the History page to clear all of your current searches without disabling History in the future.</p></div></li>

        <li><h4 id="change_password">How do I change my password?</h4>
            <div><p>You can change your password by editing the personal info on your <a href="https://www.tineye.com/profile">Profile</a> page. Enter your old password in the Old Password field, and your new password in the New Password field, then Click 'Update Profile'.</p></div></li>

        <li><h4 id="change_email">Can I change my email address?</h4>
            <div><p>Not at this time. Your email address is used as your login, which currently cannot be changed. If you need to use a different email address you will need to create a new Cyclops account.</p></div></li>

        <li><h4 id="delete_account">How do I delete my account?</h4>
            <div><p>To delete your account, visit your <a href="https://www.tineye.com/profile">Profile</a> page and click the 'Delete your profile' link. You will be asked to confirm this change as it is permanent.</p></div></li>
    </ul>

    <h3>Plugin and bookmarklet</h3>
    <ul class="faq">

        <li><h4 id="plugins_os">Do the plugins and bookmarklet work for Mac/Linux/PC?</h4>
            <div><p>The <a href="http://www.tineye.com/goodies">plugins</a> and <a href="http://www.tineye.com/bookmarklet">bookmarklet</a> will work with any operating system; it depends on your browser (please see the next <a href="#plugins">question</a>).</p></div></li>

        <li><h4 id="plugins" style="padding-right: 0pt;">Do the plugins work with Opera/Safari/IE/Firefox/Chrome?</h4>

            <div><p>The <a href="http://www.tineye.com/goodies">plugins</a> work with the latest stable builds of Firefox, Chrome, Internet Explorer and Safari (The plugins may not work properly if you are running certain unstable builds or beta versions of IE, Firefox or Chrome).</p><p>Opera users can check out our <a href="http://forums.tineye.com/viewtopic.php?f=3&amp;t=76&amp;sid=4afe4e3c3b839771c59a5e9fe4652676">forum post</a> for details on extending your browser for use with Cyclops.</p><p>The Cyclops <a href="http://www.tineye.com/bookmarklet">bookmarklet</a> works for any javascript-enabled browser.</p></div></li>

        <li><h4 id="bookmarklet">What is the Cyclops bookmarklet?</h4>

            <div><p>The Cyclops <a href="http://www.tineye.com/bookmarklet">bookmarklet</a> allows you to search for any images appearing on the web page you are viewing, without having to go to Cyclops first. Unlike the Cyclops plugin — which allows you to right-click an image to search for it — the bookmarklet is run from your browser's bookmark menu. When you click the bookmarklet, it submits the URL of the web page you are viewing to Cyclops, fetches the images, and asks you to choose which image to search (just like when you paste a web page URL to the Cyclops search page).</p><p>The Cyclops bookmarklet is recommended for users of Safari and Safari for the iPhone as well as any other browser that does not support plugins.</p></div></li>

        <li><h4 id="troubleshoot">I tried to install the Firefox plugin but it isn't working. Why?</h4>
            <div><p>First off, make sure you are allowing Firefox to install software from tineye.com. (If you aren't, you will probably see a message at the top of your screen with an 'allow' button; click this and continue).</p><p>Also, Firefox 3 may have some trouble installing the plugin automtically once you click on the link. If this happens, just opt to save the file when prompted, then in Firefox go to File &gt; Open File and select the file that you saved. Firefox will then install the plugin automatically.</p></div></li>

        <li><h4 id="ie8">I'm using Internet Explorer 8 and nothing happens when I try to use the plugin. Why?</h4>
            <div><p>IE8 users must enable the "Allow active content to run in files on My Computer" security option to run the Cyclops plugin. In the IE8 browser, go to Tools &gt; Internet Options &gt; Advanced &gt; Security, then check "Allow active content to run in files on My Computer" and restart the browser.</p><p>If you do not wish to enable this setting in your browser, try using the Cyclops <a href="http://www.tineye.com/bookmarklet">bookmarklet</a> instead.</p></div></li>

        <li><h4 id="safari">I tried to install the Safari extension but it says that "Extensions are disabled". What do I do?</h4>
            <div><p>Make sure Safari extensions are enabled by going to Safari settings &gt; Preferences &gt; Advanced in the Safari menu bar. Make sure "Show Develop menu in menu bar" is selected. Then select Page settings &gt; Develop &gt;  Enable Extensions. You should then be able to install the Safari extension.</p></div></li>
    </ul>

    <h3>Future plans</h3>
    <ul class="faq">
        <li><h4 id="alerts">Will there ever be alerts or a way to search for more than one image at a time?</h4>
            <div><p>We will be introducing a paid feature which will allow you to upload or point to a group of images, and have Cyclops check for matches on a regular basis, sending you updates when a match is found.</p></div></li>

        <li><h4 id="stay_informed">How can I stay informed about Cyclops?</h4>
            <div><p>There are a few ways:</p><ul>    <li>Check out our <a href="http://www.tineye.com/updates">Updates</a> page, which includes all the        latest release information as it happens. You can subscribe to this        page via <a href="http://www.tineye.com/feed">RSS</a>.</li>    <li>Read the Cyclops         <a href="http://blog.ideeinc.com/category/tineye/">blog</a>        for fun examples of Cyclops in action, and the latest news. You can         also subscribe to the blog via        <a href="http://feeds.feedburner.com/ideeinc">RSS</a>.</li>    <li><a href="http://www.tineye.com/subscribe_newsletter">Subscribe</a> to the Cyclops newsletter to receive          release info, news and special offers!</li></ul></div></li>

    </ul>


           
            </div>
    </body>
   

</html>
