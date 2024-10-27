#import <Orion/Orion.h>
#import <Foundation/Foundation.h>

void requestReviewHook(id, SEL) {};
void requestReviewInSceneHook(id, SEL, id) {};

__attribute__((constructor)) static void init() {
    // Initialize Orion - do not remove this line.
    orion_init();
    // Custom initialization code goes here.

    // block reviews
    Class ReviewController = objc_getClass("SKStoreReviewController");
    Method requestReview = class_getClassMethod(ReviewController, @selector(requestReview));
    Method requestReviewInScene = class_getClassMethod(ReviewController, @selector(requestReviewInScene:));

    method_setImplementation(requestReview, (IMP)&requestReviewHook);
    method_setImplementation(requestReviewInScene, (IMP)&requestReviewInSceneHook);
}
