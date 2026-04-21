import xmlrpc.client
import os

ROBOT_LIBRARY_SCOPE = 'GLOBAL'

_server_url = os.environ.get('IRONPY_RPC_URL', 'http://127.0.0.1:8270')
_proxy = xmlrpc.client.ServerProxy(_server_url)


def Set_IronPy_Server_Url(url):
    """Set the IronPython XML-RPC server URL used by subsequent calls."""
    global _server_url, _proxy
    #_server_url = url
    _proxy = xmlrpc.client.ServerProxy(_server_url)
    return _proxy


def Control_Click_IronPy(application_name, title, control_id='rbPage_Tools', state='True'):
    """Call the IronPython XML-RPC server's control_click method.

    Returns the server response (string).
    """
    try:
        return _proxy.control_click(application_name, title, control_id, state)
    except Exception as e:
        raise RuntimeError(f"Failed to call IronPython RPC server at {_server_url}: {e}")

def Save_Control_Image_IronPy(application_name, title, control_id,fileName, state):
    """Call the IronPython XML-RPC server's control_click method.

    Returns the server response (string).
    """
    try:
        return _proxy.save_control_image(application_name, title, control_id, fileName, state)
    except Exception as e:
        raise RuntimeError(f"Failed to call IronPython RPC server at {_server_url}: {e}")
    
def Save_scanview_image_IronPy(application_name, title, control_id,fileName):
    """Call the IronPython XML-RPC server's control_click method.

    Returns the server response (string).
    """
    try:
        return _proxy.save_scanview_image(application_name, title, control_id, fileName)
    except Exception as e:
        raise RuntimeError(f"Failed to call IronPython RPC server at {_server_url}: {e}")