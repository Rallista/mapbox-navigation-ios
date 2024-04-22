import Foundation
import MapLibre
import Turf

extension MLNStyle {
    
    /**
     Remove the given style layers from the style in order.
     */
    func remove(_ layers: [MLNStyleLayer]) {
        for layer in layers {
            removeLayer(layer)
        }
    }
    
    /**
     Remove the given sources from the style.
     
     Only remove a source after removing all the style layers that use it.
     */
    func remove(_ sources: Set<MLNSource>) {
        for source in sources {
            removeSource(source)
        }
    }

    /**
     Convenience method for adding a circle at a given coordinate.

     Useful for debugging or visualizing data.
     */
    public func addDebugCircleLayer(identifier: String, coordinate: CLLocationCoordinate2D, color: UIColor = UIColor.purple) {
        let point = MLNPointFeature()
        point.coordinate = coordinate

        let dataSource = MLNShapeSource(identifier: "debugCircleLayer" + identifier, features: [point], options: nil)
        addSource(dataSource)

        let circle = MLNCircleStyleLayer(identifier: "debugCircleLayer" + identifier, source: dataSource)
        circle.circleRadius = NSExpression(forConstantValue: 10)
        circle.circleOpacity = NSExpression(forConstantValue: 0.75)
        circle.circleColor = NSExpression(forConstantValue: color)
        circle.circleStrokeWidth = NSExpression(forConstantValue: NSNumber(4))
        circle.circleStrokeColor = NSExpression(forConstantValue: UIColor.white)

        addLayer(circle)
    }

    /**
     Convenience method for adding a line connecting a given set of coordinates.

     Useful for debugging or visualizing data.
     */
    public func addDebugLineLayer(identifier: String, coordinates: [CLLocationCoordinate2D], color: UIColor = UIColor.purple) {
        let lineString = LineString(coordinates)
        let lineFeature = MLNPolylineFeature(lineString)
        let shapeSource = MLNShapeSource(identifier: "debugLineLayer" + identifier, features: [lineFeature], options: nil)
        addSource(shapeSource)

        let lineLayer = MLNLineStyleLayer(identifier: "debugLineLayer" + identifier, source: shapeSource)
        lineLayer.lineColor = NSExpression(forConstantValue: color)
        lineLayer.lineWidth = NSExpression(forConstantValue: 8)
        lineLayer.lineCap = NSExpression(forConstantValue: "round")
        addLayer(lineLayer)
    }

    /**
     Convenience method for adding a polygon shape.

     Useful for debugging or visualizing data.
     */
    public func addDebugPolygonLayer(identifier: String, coordinates: [CLLocationCoordinate2D], color: UIColor = UIColor.purple) {
        removeDebugPolygonLayers()

        let fillFeature = MLNPolygonFeature(coordinates: coordinates, count: UInt(coordinates.count))
        let shapeSource = MLNShapeSource(identifier: "debugPolygonLayer" + identifier, features: [fillFeature], options: nil)
        addSource(shapeSource)

        let fillLayer = MLNFillStyleLayer(identifier: "debugPolygonLayer" + identifier, source: shapeSource)
        fillLayer.fillColor = NSExpression(forConstantValue: color)
        fillLayer.fillOpacity = NSExpression(forConstantValue: NSNumber(0.25))
        fillLayer.fillOutlineColor = NSExpression(forConstantValue: color)
        fillLayer.fillOpacity = NSExpression(forConstantValue: NSNumber(0.75))
        addLayer(fillLayer)
    }

    /**
     Method to remove any debug line style layers.

     Call to clean up when you no longer need any debug layers added with addDebugLineLayer(identifier:, coordinates:, color:)
     */
    public func removeDebugLineLayers() {
        // remove any old layers
        let styleLayers = layers.filter({ layer -> Bool in
            guard let layer = layer as? MLNLineStyleLayer else { return false }
            return layer.identifier.contains("debugLineLayer")
        })

        remove(styleLayers)

        // remove any old sources
        let dataSources = sources.filter({ source -> Bool in
            return source.identifier.contains("debugLineLayer")
        })

        remove(dataSources)
    }

    /**
     Method to remove any debug fill style layers.

     Call to clean up when you no longer need any debug layers added with addDebugPolygonLayer(identifier:, coordinates:, color:)
     */
    public func removeDebugPolygonLayers() {
        let styleLayers = layers.filter({ layer -> Bool in
            guard let layer = layer as? MLNFillStyleLayer else { return false }
            return layer.identifier.contains("debugPolygonLayer")
        })

        remove(styleLayers)

        // remove any old sources
        let dataSources = sources.filter({ source -> Bool in
            return source.identifier.contains("debugPolygonLayer")
        })

        remove(dataSources)
    }

    /**
     Method to remove any debug circle style layers.

     Call to clean up when you no longer need any debug layers added with addDebugCircleLayer(identifier:, coordinate:, color:)
     */
    public func removeDebugCircleLayers() {
        // remove any old layers
        let styleLayers = layers.filter({ layer -> Bool in
            guard let layer = layer as? MLNCircleStyleLayer else { return false }
            return layer.identifier.contains("debugCircleLayer")
        })

        remove(styleLayers)

        // remove any old sources
        let dataSources = sources.filter({ source -> Bool in
            return source.identifier.contains("debugCircleLayer")
        })

        remove(dataSources)
    }
}
