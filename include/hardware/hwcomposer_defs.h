/*
 * Copyright (C) 2010 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ANDROID_INCLUDE_HARDWARE_HWCOMPOSER_DEFS_H
#define ANDROID_INCLUDE_HARDWARE_HWCOMPOSER_DEFS_H

#include <stdint.h>
#include <sys/cdefs.h>

#include <hardware/gralloc.h>
#include <hardware/hardware.h>
#include <cutils/native_handle.h>

__BEGIN_DECLS

/*****************************************************************************/

#define HWC_HEADER_VERSION          1

#define HWC_MODULE_API_VERSION_0_1  HARDWARE_MODULE_API_VERSION(0, 1)

#define HWC_DEVICE_API_VERSION_0_1  HARDWARE_DEVICE_API_VERSION_2(0, 1, HWC_HEADER_VERSION)
#define HWC_DEVICE_API_VERSION_0_2  HARDWARE_DEVICE_API_VERSION_2(0, 2, HWC_HEADER_VERSION)
#define HWC_DEVICE_API_VERSION_0_3  HARDWARE_DEVICE_API_VERSION_2(0, 3, HWC_HEADER_VERSION)
#define HWC_DEVICE_API_VERSION_1_0  HARDWARE_DEVICE_API_VERSION_2(1, 0, HWC_HEADER_VERSION)
#define HWC_DEVICE_API_VERSION_1_1  HARDWARE_DEVICE_API_VERSION_2(1, 1, HWC_HEADER_VERSION)
#define HWC_DEVICE_API_VERSION_1_2  HARDWARE_DEVICE_API_VERSION_2(1, 2, HWC_HEADER_VERSION)
#define HWC_DEVICE_API_VERSION_1_3  HARDWARE_DEVICE_API_VERSION_2(1, 3, HWC_HEADER_VERSION)
#define HWC_DEVICE_API_VERSION_1_4  HARDWARE_DEVICE_API_VERSION_2(1, 4, HWC_HEADER_VERSION)

enum {
    /* hwc_composer_device_t::set failed in EGL */
    HWC_EGL_ERROR = -1
};

/*
 * hwc_layer_t::hints values
 * Hints are set by the HAL and read by SurfaceFlinger
 */
enum {
    /*
     * HWC can set the HWC_HINT_TRIPLE_BUFFER hint to indicate to SurfaceFlinger
     * that it should triple buffer this layer. Typically HWC does this when
     * the layer will be unavailable for use for an extended period of time,
     * e.g. if the display will be fetching data directly from the layer and
     * the layer can not be modified until after the next set().
     */
    HWC_HINT_TRIPLE_BUFFER  = 0x00000001,

    /*
     * HWC sets HWC_HINT_CLEAR_FB to tell SurfaceFlinger that it should clear the
     * framebuffer with transparent pixels where this layer would be.
     * SurfaceFlinger will only honor this flag when the layer has no blending
     *
     */
    HWC_HINT_CLEAR_FB       = 0x00000002,

    /*
     * HWC sets HWC_HINT_DRAW_TV_HINT to tell SurfaceFlinger that it should draw an
     * hint to tell use that video is showing on external HDMI device
     *
     */
    HWC_HINT_DRAW_TV_HINT       = 0x00010000,

    /*
     * HWC sets HWC_HINT_CLEAR_TV_HINT to tell SurfaceFlinger that it should clear
     * tv hint
     *
     */
    HWC_HINT_CLEAR_TV_HINT       = 0x00020000,
};

/*
 * hwc_layer_t::flags values
 * Flags are set by SurfaceFlinger and read by the HAL
 */
enum {
    /*
     * HWC_SKIP_LAYER is set by SurfaceFlnger to indicate that the HAL
     * shall not consider this layer for composition as it will be handled
     * by SurfaceFlinger (just as if compositionType was set to HWC_OVERLAY).
     */
    HWC_SKIP_LAYER = 0x00000001,

    HWC_IS_CURSOR_LAYER = 0x00000002,

    /*
     * HWC_OVERLAY_SKIP_LAYER indicate HWC will not let the layer goto
     * overlay. Add this as Marvell's HWC divide into Overlay and Baselay.
     */
    HWC_OVERLAY_SKIP_LAYER = 0x00010000,
    HWC_SCREENSHOT_ANIMATOR_LAYER = 0x00000002,
};

/*
 * hwc_layer_t::compositionType values
 */
enum {
    /* this layer is to be drawn into the framebuffer by SurfaceFlinger */
    HWC_FRAMEBUFFER = 0,

    /* this layer will be handled in the HWC */
    HWC_OVERLAY = 1,

    /* this is the background layer. it's used to set the background color.
     * there is only a single background layer */
    HWC_BACKGROUND = 2,

    /* this layer holds the result of compositing the HWC_FRAMEBUFFER layers.
     * Added in HWC_DEVICE_API_VERSION_1_1. */
    HWC_FRAMEBUFFER_TARGET = 3,

    /* this layer's contents are taken from a sideband buffer stream.*/
	HWC_SIDEBAND = 4,

    /* this layer will be handled in the HWC, using a blit engine */
    HWC_BLIT = 4,

    /* this layer's composition will be handled by hwcomposer by dedicated
       cursor overlay hardware. hwcomposer will also all async position updates
       of this layer outside of the normal prepare()/set() loop. Added in
       HWC_DEVICE_API_VERSION_1_4. */
    HWC_CURSOR_OVERLAY =  7,

   /* HWC_2D is not used by compositionType, only used to count HWC_2D layers
     * that go to HWC and use GC 2D Blit, compositionType will be other values defined privately
     * in HWC_2D.
     */
    HWC_2D = 5,

    /* HWC_2D_TARGET is for virtual GCU blit in HWC.
     */
    HWC_2D_TARGET = 6,
};

/*
 * hwc_layer_t::blending values
 */
enum {
    /* no blending */
    HWC_BLENDING_NONE     = 0x0100,

    /* ONE / ONE_MINUS_SRC_ALPHA */
    HWC_BLENDING_PREMULT  = 0x0105,

    /* SRC_ALPHA / ONE_MINUS_SRC_ALPHA */
    HWC_BLENDING_COVERAGE = 0x0405,

    /* Dim layer */
    HWC_BLENDING_DIM      = 0x0805,
};

/*
 * hwc_layer_t::transform values
 */
enum {
    /* flip source image horizontally */
    HWC_TRANSFORM_FLIP_H = HAL_TRANSFORM_FLIP_H,
    /* flip source image vertically */
    HWC_TRANSFORM_FLIP_V = HAL_TRANSFORM_FLIP_V,
    /* rotate source image 90 degrees clock-wise */
    HWC_TRANSFORM_ROT_90 = HAL_TRANSFORM_ROT_90,
    /* rotate source image 180 degrees */
    HWC_TRANSFORM_ROT_180 = HAL_TRANSFORM_ROT_180,
    /* rotate source image 270 degrees clock-wise */
    HWC_TRANSFORM_ROT_270 = HAL_TRANSFORM_ROT_270,
};

/* attributes queriable with query() */
enum {
    /*
     * Availability: HWC_DEVICE_API_VERSION_0_2
     * Must return 1 if the background layer is supported, 0 otherwise.
     */
    HWC_BACKGROUND_LAYER_SUPPORTED      = 0,

    /*
     * Availability: HWC_DEVICE_API_VERSION_0_3
     * Returns the vsync period in nanoseconds.
     *
     * This query is not used for HWC_DEVICE_API_VERSION_1_1 and later.
     * Instead, the per-display attribute HWC_DISPLAY_VSYNC_PERIOD is used.
     */
    HWC_VSYNC_PERIOD                    = 1,

    /*
     * Availability: HWC_DEVICE_API_VERSION_1_1
     * Returns a mask of supported display types.
     */
    HWC_DISPLAY_TYPES_SUPPORTED         = 2,

    /*
     * Returns the maximum supported width for virtual displays that need
     * to use WriteBack.
     */
    HWC_MAX_WRITEBACK_WIDTH                = 3,
};

/* display attributes returned by getDisplayAttributes() */
enum {
    /* Indicates the end of an attribute list */
    HWC_DISPLAY_NO_ATTRIBUTE                = 0,

    /* The vsync period in nanoseconds */
    HWC_DISPLAY_VSYNC_PERIOD                = 1,

    /* The number of pixels in the horizontal and vertical directions. */
    HWC_DISPLAY_WIDTH                       = 2,
    HWC_DISPLAY_HEIGHT                      = 3,

    /* The number of pixels per thousand inches of this configuration.
     *
     * Scaling DPI by 1000 allows it to be stored in an int without losing
     * too much precision.
     *
     * If the DPI for a configuration is unavailable or the HWC implementation
     * considers it unreliable, it should set these attributes to zero.
     */
    HWC_DISPLAY_DPI_X                       = 4,
    HWC_DISPLAY_DPI_Y                       = 5,
    HWC_DISPLAY_FORMAT                      = 6,
};

/* Allowed events for hwc_methods::eventControl() */
enum {
    HWC_EVENT_VSYNC     = 0,
    HWC_EVENT_ORIENTATION
};

/* Display types and associated mask bits. */
enum {
    HWC_DISPLAY_PRIMARY     = 0,
    HWC_DISPLAY_EXTERNAL    = 1,    // HDMI, DP, etc.
    HWC_DISPLAY_VIRTUAL     = 2,

    HWC_NUM_PHYSICAL_DISPLAY_TYPES = 2,
    HWC_NUM_DISPLAY_TYPES          = 3,
};

enum {
    HWC_DISPLAY_PRIMARY_BIT     = 1 << HWC_DISPLAY_PRIMARY,
    HWC_DISPLAY_EXTERNAL_BIT    = 1 << HWC_DISPLAY_EXTERNAL,
    HWC_DISPLAY_VIRTUAL_BIT     = 1 << HWC_DISPLAY_VIRTUAL,
};

enum {
    HWC_POWER_MODE_OFF      = 0,
    HWC_POWER_MODE_DOZE     = 1,
    HWC_POWER_MODE_NORMAL   = 2,
    HWC_POWER_MODE_DOZE_SUSPEND  = 3,
};

/*****************************************************************************/

__END_DECLS

#endif /* ANDROID_INCLUDE_HARDWARE_HWCOMPOSER_DEFS_H */
