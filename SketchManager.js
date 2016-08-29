/**
 * Depends on jQuery and Processing
 */

/**
 * Constructor
 * @param canvasId {String} id attribute value of <canvas/> tag in use
 * @param sketches {Array} list of sketches that can be rendered
 * @constructor
 */
function SketchManager(canvasId, sketches) {
    this.canvasId = canvasId;
    this.sketches = sketches;
}

/**
 * Get the canvas used by the sketch manager
 * @returns {Element} DOM element associated with @this.canvasId
 */
SketchManager.prototype.getCanvas = function() {
    return document.getElementById(this.canvasId);
};

/**
 * Get processing instance associated with this manager
 * @returns {*} processing instance
 */
SketchManager.prototype.getProcessingInstance = function() {
    return Processing.getInstanceById(this.canvasId);
};

/**
 * Load a sketch into the manager's canvas.
 * @param sketch sketch to load
 * @returns {boolean} false if sketch name unknown true otherwise
 */
SketchManager.prototype.load = function(sketch) {
    if ($.inArray(sketch, this.sketches) == -1) return false;

    var canvas = this.getCanvas(),
        context = canvas.getContext('2d');

    var pInstance = this.getProcessingInstance();
    if (pInstance) pInstance.exit();

    context.setTransform(1, 0, 0, 1, 0, 0);
    context.clearRect(0, 0, canvas.width, canvas.height);
    // Now, load the new Processing script
    Processing.loadSketchFromSources(canvas, ['sketches/' + sketch + '/' + sketch + '.pde']);

    return true;
};

/**
 * Stops the currently playing sketch.
 */
SketchManager.prototype.stop = function() {
    this.getProcessingInstance().noLoop();
};

/**
 * Resumes the currently playing sketch.
 */
SketchManager.prototype.play = function() {
    this.getProcessingInstance().loop();
};