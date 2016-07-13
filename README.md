# Compare different kinds of performSelector: and GCD execute timing in UIViewController lifeCycle


[self performSelector:sel];

[self performSelector:sel withObject:nil];

[self performSelector:sel withObject:nil afterDelay:0.0];

[self performSelectorOnMainThread:sel withObject:nil waitUntilDone:NO];

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
[self print];
});

dispatch_async(dispatch_get_main_queue(), ^{
[self print];
});

// will lock forever

dispatch_sync(dispatch_get_main_queue(), ^{
[self print];
});

- (void)print
{
NSLog(@"++++++++ type %d +++++++++", type);
}

———————————————————————splendid seperator—————————————————

2016-07-13 11:29:39.438 testPerformSelector[3813:94978] viewDidLoad
2016-07-13 11:29:39.438 testPerformSelector[3813:94978] ++++++++ type 0 +++++++++
2016-07-13 11:29:39.438 testPerformSelector[3813:94978] viewWillAppear
2016-07-13 11:29:39.447 testPerformSelector[3813:94978] viewDidAppear

2016-07-13 11:29:59.525 testPerformSelector[3837:95754] viewDidLoad
2016-07-13 11:29:59.526 testPerformSelector[3837:95754] ++++++++ type 1 +++++++++
2016-07-13 11:29:59.526 testPerformSelector[3837:95754] viewWillAppear
2016-07-13 11:29:59.531 testPerformSelector[3837:95754] viewDidAppear

2016-07-13 11:30:13.828 testPerformSelector[3856:96306] viewDidLoad
2016-07-13 11:30:13.832 testPerformSelector[3856:96306] viewWillAppear
2016-07-13 11:30:13.838 testPerformSelector[3856:96306] viewDidAppear
2016-07-13 11:30:13.839 testPerformSelector[3856:96306] ++++++++ type 2 +++++++++

2016-07-13 11:30:35.692 testPerformSelector[3884:97145] viewDidLoad
2016-07-13 11:30:35.692 testPerformSelector[3884:97145] viewWillAppear
2016-07-13 11:30:35.696 testPerformSelector[3884:97145] viewDidAppear
2016-07-13 11:30:35.696 testPerformSelector[3884:97145] ++++++++ type 3 +++++++++

2016-07-13 11:30:51.151 testPerformSelector[3903:97714] viewDidLoad
2016-07-13 11:30:51.151 testPerformSelector[3903:97714] viewWillAppear
2016-07-13 11:30:51.157 testPerformSelector[3903:97714] viewDidAppear
2016-07-13 11:30:51.212 testPerformSelector[3903:97714] ++++++++ type 4 +++++++++

2016-07-13 11:31:10.925 testPerformSelector[3922:98550] viewDidLoad
2016-07-13 11:31:10.926 testPerformSelector[3922:98550] viewWillAppear
2016-07-13 11:31:10.930 testPerformSelector[3922:98550] viewDidAppear
2016-07-13 11:31:10.987 testPerformSelector[3922:98550] ++++++++ type 5 +++++++++

2016-07-13 11:32:39.940 testPerformSelector[3990:100915] viewDidLoad
//locking forever
