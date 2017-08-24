//
//  NodeToUIImage.swift
//  Macaw
//
//  Created by Simon Corsin on 8/24/17.
//  Copyright © 2017 Exyte. All rights reserved.
//

import Foundation
import UIKit

public extension Node {

    /**
     Render the Node into the given CGContext.
     */
    public func render(to context: CGContext) {
        let renderContext = RenderContext(view: nil)
        renderContext.cgContext = context

        let nodeRenderer = RenderUtils.createNodeRenderer(self, context: renderContext, animationCache: nil)
        defer { nodeRenderer.dispose() }
        
        nodeRenderer.render(force: true, opacity: 1)
    }

    /**
     Returns a UIImage by rendering this node into an image context.
     */
    public func toUIImage(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        defer { UIGraphicsEndImageContext() }

        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        render(to: context)

        return UIGraphicsGetImageFromCurrentImageContext()
    }

}
