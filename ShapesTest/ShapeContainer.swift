//
//  ShapeContainer.swift
//  ShapesTest
//
//  Created by Marc Vandehey on 8/20/17.
//  Copyright © 2017 SkyVan Labs. All rights reserved.
//

import UIKit

class ShapeContainer: UIView {
  private var padding: CGFloat = 0
  private var shapeLayer = CAShapeLayer()
  private var trianglePath = UIBezierPath()
  private var squarePath = UIBezierPath()
  private var hexagonPath = UIBezierPath()

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    setup()
  }

  func showTriangle() {
    animateTo(path: trianglePath.cgPath)

    shapeLayer.path = trianglePath.cgPath
  }

  func showSquare() {
    animateTo(path: squarePath.cgPath)

    shapeLayer.path = squarePath.cgPath
  }

  func showHexagon() {
    animateTo(path: hexagonPath.cgPath)

    shapeLayer.path = hexagonPath.cgPath
  }

  private func animateTo(path: CGPath) {
    let animation = CABasicAnimation(keyPath: "path")
    animation.duration = 0.25
    animation.fromValue = shapeLayer.path
    animation.toValue = path

    shapeLayer.add(animation, forKey: animation.keyPath)
  }

  private func setup() {
    padding = frame.size.width * 0.1

    setupTrianglePath()
    setupSquarePath()
    setupHexagonPath()

    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = UIColor.black.cgColor
    shapeLayer.lineWidth = 15

    shapeLayer.lineJoin = kCALineJoinRound

    layer.addSublayer(shapeLayer)
  }

  private func setupTrianglePath() {
    let p0 = CGPoint(x: frame.size.width / 2, y: padding)
    let p1 = CGPoint(x: frame.size.width - padding, y: frame.size.height - padding)
    let p2 = CGPoint(x: padding, y: frame.size.height - padding)

    trianglePath.move(to: p0)
    trianglePath.addLine(to: p0)

    trianglePath.addLine(to: CGPoint(x: (p0.x + p1.x) / 2, y: (p0.y + p1.y) / 2))

    trianglePath.addLine(to: p1)
    trianglePath.addLine(to: p2)

    trianglePath.addLine(to: CGPoint(x: (p0.x + p2.x) / 2, y: (p0.y + p2.y) / 2))

    trianglePath.close()
  }

  private func setupSquarePath() {
    squarePath.move(to: CGPoint(x: padding, y: padding))
    squarePath.addLine(to: CGPoint(x: frame.size.width - padding, y: padding))
    squarePath.addLine(to: CGPoint(x: frame.size.width - padding, y: frame.size.height / 2))
    squarePath.addLine(to: CGPoint(x: frame.size.width - padding, y: frame.size.height - padding))
    squarePath.addLine(to: CGPoint(x: padding, y: frame.size.height - padding))
    squarePath.addLine(to: CGPoint(x: padding, y: frame.size.height / 2))

    squarePath.close()
  }

  private func setupHexagonPath() {
    let sideLength = frame.size.width - padding * 2
    hexagonPath.move(to: CGPoint(x: padding + sideLength * 0.25, y: padding))
    hexagonPath.addLine(to: CGPoint(x: padding + sideLength * 0.75, y: padding))
    hexagonPath.addLine(to: CGPoint(x: frame.size.width - padding, y: frame.size.height / 2))

    hexagonPath.addLine(to: CGPoint(x: padding + sideLength * 0.75, y: frame.size.height - padding))
    hexagonPath.addLine(to: CGPoint(x: padding + sideLength * 0.25, y: frame.size.height - padding))

    hexagonPath.addLine(to: CGPoint(x: padding, y: frame.size.height / 2))

    hexagonPath.close()
  }
}
